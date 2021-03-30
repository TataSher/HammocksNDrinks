require 'database_connection'

describe DatabaseConnection do
	 describe '.setup' do
 	 	it 'setup the database connection' do
  		 	connection = DatabaseConnection.setup
  		 	expect(connection.db).to eq('makers_hnd_database_test')
  		end
 	end

	 describe '.query' do
 	 	it 'sends a query or instruction to the database' do
  		 	expect(DatabaseConnection).to respond_to(:query).with(1).argument
  		 	connection = DatabaseConnection.setup
  		 	sql = "INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('test_name', 'test_description', 50, 1);"
  		 	expect(connection.query(sql)[0]['name']).to eq 'test_name'
  		end
 	end
end
