require_relative 'database_connection'

class SpaceHammock
  attr_reader :name, :description, :price_per_night, :owner

  def initialize(name, description, price_per_night, owner)
    @name = name
    @description = description
    @price_per_night = price_per_night
    @owner = owner
  end

  def self.create(name, description, price_per_night, owner_id)
    sql = "INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('#{name}', '#{description}', #{price_per_night}, #{owner_id});"
    DatabaseConnection.query(sql)
  end
end
