require 'spaces'
require_relative './../database_helper'

describe Spaces do

  describe '#add_space' do

    it 'adds a new space' do
      User.add_user(username: 'test', email: 'test@makers.co.uk', fullname: 'test user', pw: 'abc123')
      Spaces.add_space('Cosy Cottage', 'Extremely cosy cottage in the woods', '70', 1)
      expect(Spaces.all.count).to eq 1
      expect(Spaces.all[0].space_name).to eq 'Cosy Cottage'
    end

  end

  describe '#all' do

    it 'returns an array of Spaces objects' do

      User.add_user(username: 'test', email: 'test@makers.co.uk', fullname: 'test user', pw: 'abc123')
      Spaces.add_space('Cosy Cottage', 'Extremely cosy cottage in the woods', '70', 1)
      space = Spaces.add_space('Cosy Villa', 'Extremely villa cottage in the woods', '50', 1)
      Spaces.add_space('Cosy Mansion', 'Extremely mansion cottage in the woods', '150', 1)

      persisted_data = persisted_data_spaces(space)

      expect(Spaces.all.count).to eq 3
      expect(Spaces.all[0]).to be_an_instance_of Spaces
      expect(Spaces.all[1].space_id).to eq persisted_data['space_id']
      expect(Spaces.all[2].space_name).to eq 'Cosy Mansion'
      expect(Spaces.all[0].space_description).to eq 'Extremely cosy cottage in the woods'
      expect(Spaces.all[1].price_per_night).to eq '$50.00'

    end

  end

  describe '#edit_space' do

    it 'edits a space\'s details' do
      User.add_user(username: 'test', email: 'test@makers.co.uk', fullname: 'test user', pw: 'abc123')
      Spaces.add_space('Cosy Cottage', 'Extremely cosy cottage in the woods', '70', 1)
      Spaces.edit_space(1, 'Hole in the Wall', 'Cold & Dirty', 2)
      expect(Spaces.all.count).to eq 1
      expect(Spaces.all[0].space_id).to eq '1'
      expect(Spaces.all[0].space_name).to eq 'Hole in the Wall'
      expect(Spaces.all[0].space_description).to eq 'Cold & Dirty'
      expect(Spaces.all[0].price_per_night).to eq '$2.00'
    end

  end

  describe '#add_availability #availability' do

    it 'adds and returns a space\'s availabile dates respectively' do
      User.add_user(username: 'test', email: 'test@makers.co.uk', fullname: 'test user', pw: 'abc123')
      Spaces.add_space('Cosy Cottage', 'Extremely cosy cottage in the woods', '70', 1)
      Spaces.add_availability(1, '2022-01-01', '2022-01-03')
      availability = Spaces.availability(1)
      expect(availability[0]['dates']).to eq '2022-01-01'
      expect(availability[1]['dates']).to eq '2022-01-02'
      expect(availability[2]['dates']).to eq '2022-01-03'
    end

  end

  describe '#delete' do

    it 'deletes a space' do
      User.add_user(username: 'test', email: 'test@makers.co.uk', fullname: 'test user', pw: 'abc123')
      Spaces.add_space('Cosy Cottage', 'Extremely cosy cottage in the woods', '70', 1)
      expect(Spaces.all.count).to eq 1
      expect(Spaces.all[0].space_name).to eq 'Cosy Cottage'
      Spaces.delete(1)
      expect(Spaces.all.count).to eq 0
      expect(Spaces.all[0]).to eq nil
    end

  end


end

# describe Bookmarks do
# let(:bookmarks) { described_class.all }   

#   describe '#all' do
#     it 'returns an array of Bookmarks objects' do
#       expect(bookmarks.count).to eq 3
#       expect(bookmarks[0]).to be_an_instance_of Bookmarks
#       expect(bookmarks[1].id).to eq '2'
#       expect(bookmarks[2].url).to eq 'http://www.google.com'
#       expect(bookmarks[0].title).to eq 'makers'
#     end
#   end

#   describe '#add' do  
#     it 'adds a new bookmark' do
#       # p bookmarks - this would cause an error because the object returned by Bookmarks.all (before Bookmarks.add is applied) would be stored
#       # in the 'bookmarks' variable. The test only refer to what is stored in the variable, it doesn not call Bookmarks.all again. Therefore 
#       # they would fail because, the final index in bookmarks all would not exist yet.
#       expect(Bookmarks.all.count).to eq 3
#       Bookmarks.add('https://www.codecademy.com/', 'codecademy')
#       expect(bookmarks[3].id).to eq '4'
#       expect(bookmarks[3].url).to eq 'https://www.codecademy.com/'
#       expect(bookmarks[3].title).to eq 'codecademy'
#       expect(Bookmarks.all.count).to eq 4
#     end

  
#     it 'does not create a new bookmark when an invalid URL is submitted' do
#       expect(Bookmarks.all.count).to eq 3
#       DatabaseConnection.query('DELETE FROM bookmarks')
#       expect(Bookmarks.all.count).to eq 0
#       Bookmarks.add('invalidurl', 'invalidurl')
#       expect(Bookmarks.all.count).to eq 0
#     end

#   end

#   describe '#delete' do  
#     it 'deletes a bookmark by id' do
#       Bookmarks.delete(1)
#       expect(bookmarks[0].id).to eq '2'
#       expect(bookmarks[0].id).not_to eq '1'
#       expect(bookmarks[0].url).to eq 'http://www.destroyallsoftware.com'
#       expect(bookmarks[0].url).not_to eq 'http://www.makersacademy.com'
#       expect(bookmarks[0].title).to eq 'destroyallsoftware'
#       expect(bookmarks[0].title).not_to eq 'makers'
#     end
#   end

#   describe '#edit' do  
#     it 'edits a bookmark by id' do
#       Bookmarks.edit(1, 'http://www.bakersacademy.com', 'bakers')
#       expect(bookmarks[0].url).to eq 'http://www.bakersacademy.com'
#       expect(bookmarks[0].url).not_to eq 'http://www.makersacademy.com'
#       expect(bookmarks[0].title).to eq 'bakers'
#       expect(bookmarks[0].title).not_to eq 'makers'
      
#     end
#   end

# end
