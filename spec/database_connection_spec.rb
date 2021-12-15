require 'database_connection'

describe DatabaseConnection do
  
  context '#setup'
  it 'returns a postgres connection instance' do
    connection = DatabaseConnection.setup('makersbnb_test') 
    expect(connection).to be_an_instance_of PG::Connection
  end

  it 'sets up a connection to a database through PG' do
    expect(PG).to receive(:connect).with(dbname: 'makersbnb_test') 
    DatabaseConnection.setup('makersbnb_test') 
    allow(PG).to receive(:connect).and_call_original
  end

  it 'this connection is persistent' do
    connection = DatabaseConnection.setup('makersbnb_test') 
    expect(DatabaseConnection.connection).to eq connection
  end

  context '#query' 
  it 'returns an postgres query result instance' do
    DatabaseConnection.setup('makersbnb_test') 
    expect(DatabaseConnection.query('TABLE users')).to be_an_instance_of PG::Result 
  end

  it 'executes a query via PG' do
    connect = DatabaseConnection.setup('makersbnb_test')
    expect(connect).to receive(:exec_params).with("TABLE users;", []) 
    DatabaseConnection.query("TABLE users;") 
    allow(connect).to receive(:exec_params).with("TABLE users;", []).and_call_original
  end
  
end
