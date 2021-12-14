require 'database_connection'

describe DatabaseConnection do
  
  describe '#setup' do

    it 'returns a postgres connection instance' do
      connection = DatabaseConnection.setup('bookmark_manager_test') 
      expect(connection).to be_an_instance_of PG::Connection
    end

    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test') 
      DatabaseConnection.setup('bookmark_manager_test') 
      allow(PG).to receive(:connect).and_call_original
      
    end

    it 'this connection is persistent' do
      connection = DatabaseConnection.setup('bookmark_manager_test') 
      expect(DatabaseConnection.connection).to eq connection
    end

  end

  describe '#query' do
    it 'returns an postgres query result instance' do
      DatabaseConnection.setup('bookmark_manager_test') 
      expect(DatabaseConnection.query('TABLE bookmarks')).to be_an_instance_of PG::Result 
    end

    it 'executes a query via PG' do
      connect = DatabaseConnection.setup('bookmark_manager_test')
      expect(connect).to receive(:exec_params).with("TABLE bookmarks;", []) 
      DatabaseConnection.query("TABLE bookmarks;") 
      allow(connect).to receive(:exec_params).with("TABLE bookmarks;", []).and_call_original
    end
  end 

end