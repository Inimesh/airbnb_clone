require 'bookmarks'

describe Bookmarks do
let(:bookmarks) { described_class.all }   

  describe '#all' do
    it 'returns an array of Bookmarks objects' do
      expect(bookmarks.count).to eq 3
      expect(bookmarks[0]).to be_an_instance_of Bookmarks
      expect(bookmarks[1].id).to eq '2'
      expect(bookmarks[2].url).to eq 'http://www.google.com'
      expect(bookmarks[0].title).to eq 'makers'
    end
  end

  describe '#add' do  
    it 'adds a new bookmark' do
      # p bookmarks - this would cause an error because the object returned by Bookmarks.all (before Bookmarks.add is applied) would be stored
      # in the 'bookmarks' variable. The test only refer to what is stored in the variable, it doesn not call Bookmarks.all again. Therefore 
      # they would fail because, the final index in bookmarks all would not exist yet.
      expect(Bookmarks.all.count).to eq 3
      Bookmarks.add('https://www.codecademy.com/', 'codecademy')
      expect(bookmarks[3].id).to eq '4'
      expect(bookmarks[3].url).to eq 'https://www.codecademy.com/'
      expect(bookmarks[3].title).to eq 'codecademy'
      expect(Bookmarks.all.count).to eq 4
    end

  
    it 'does not create a new bookmark when an invalid URL is submitted' do
      expect(Bookmarks.all.count).to eq 3
      DatabaseConnection.query('DELETE FROM bookmarks')
      expect(Bookmarks.all.count).to eq 0
      Bookmarks.add('invalidurl', 'invalidurl')
      expect(Bookmarks.all.count).to eq 0
    end


  end

  describe '#delete' do  
    it 'deletes a bookmark by id' do
      Bookmarks.delete(1)
      expect(bookmarks[0].id).to eq '2'
      expect(bookmarks[0].id).not_to eq '1'
      expect(bookmarks[0].url).to eq 'http://www.destroyallsoftware.com'
      expect(bookmarks[0].url).not_to eq 'http://www.makersacademy.com'
      expect(bookmarks[0].title).to eq 'destroyallsoftware'
      expect(bookmarks[0].title).not_to eq 'makers'
    end
  end

  describe '#edit' do  
    it 'edits a bookmark by id' do
      Bookmarks.edit(1, 'http://www.bakersacademy.com', 'bakers')
      expect(bookmarks[0].url).to eq 'http://www.bakersacademy.com'
      expect(bookmarks[0].url).not_to eq 'http://www.makersacademy.com'
      expect(bookmarks[0].title).to eq 'bakers'
      expect(bookmarks[0].title).not_to eq 'makers'
      
    end
  end

end