require_relative 'database_connection'

class SpaceHammock
  def self.create(name, description, price_per_night, owner_id)
    sql = "INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('#{name}', '#{description}', #{price_per_night}, #{owner_id});"
    DatabaseConnection.query(sql)
  end
end
