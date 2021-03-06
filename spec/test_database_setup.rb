require 'pg'

def connect_to_test_database
	 PG.connect(dbname: 'makers_hnd_database_test')
end

def clean_test_database(connection)
	 connection.exec("DROP TABLE IF EXISTS hammocks;")
	 connection.exec("DROP TABLE IF EXISTS users CASCADE;")
end

def create_bookmarks_table_in_test(connection)
	 connection.exec("CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    email VARCHAR(200) UNIQUE, 
    password VARCHAR(140), 
    name VARCHAR(200), 
    username VARCHAR(200) UNIQUE
  );")
	 connection.exec("CREATE TABLE hammocks (
   id SERIAL PRIMARY KEY,
   name VARCHAR(200),
   description VARCHAR(1000),
   price_per_night NUMERIC(38,2),
   owner_id INTEGER REFERENCES users(id),
   booked BOOLEAN,
   booked_by_user_id INTEGER REFERENCES users(id)
   );")
end


def populate_tables(connection)
  connection.exec("INSERT INTO users (email, password, name, username) VALUES('test@email.com', 'testpass', 'test_user', 'test_username');")
end

def setup_test_database
  connection = connect_to_test_database
  clean_test_database(connection)
  create_bookmarks_table_in_test(connection)
  populate_tables(connection)
end
