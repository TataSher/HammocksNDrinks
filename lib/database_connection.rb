require 'pg'

class DatabaseConnection
  def self.setup
    @@database = PG.connect(dbname: database_connect)
  end

  def self.query(query_string)
 		 @@database.exec(query_string)
  end

  def self.database_connect
    if ENV['ENVIRONMENT'] == 'test'
      'makers_hnd_database_test'
    else
      'makers_hnd_database'
    end
  end

  private_class_method :database_connect
end
