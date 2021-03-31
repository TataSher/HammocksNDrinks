require_relative 'database_connection'

class SpaceHammock
  attr_reader :id, :name, :description, :price_per_night, :owner_id, :booked, :booked_by_user_id

  def initialize(id, name, description, price_per_night, owner_id, booked=false, booked_by_user_id=nil)
    @id = id
    @name = name
    @description = description
    @price_per_night = price_per_night
    @owner_id = owner_id
    @booked = booked
    @booked_by_user_id = booked_by_user_id
  end

  def self.create(name, description, price_per_night, owner_id)
    sql = "INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('#{name}', '#{description}', #{price_per_night}, #{owner_id});"
    DatabaseConnection.query(sql)
  end

  def self.all
    all_space_hammocks = []
    result = DatabaseConnection.query("SELECT * FROM hammocks")
		result.map do |hammock|
          all_space_hammocks << {:name => "#{hammock['name']}", :description => "#{hammock['description']}", :price_per_night => "#{hammock['price_per_night']}"}
		end
    all_space_hammocks
  end

  def self.find(hammock_id)
    sql = "SELECT * FROM hammocks WHERE id='#{hammock_id}';"
    begin
      result = DatabaseConnection.query(sql).first
      SpaceHammock.new(result["id"], result["name"], result["description"], result["price_per_night"], result["owner_id"], result["booked"], result["booked_by_user_id"])
    rescue StandardError => e
      p e
      p "There is no hammock with id #{hammock_id}"
      nil
    end
  end

  def book(user_id)
    return false if DatabaseConnection.query("SELECT booked FROM hammocks WHERE id='#{@id}'").first['booked'] == 't'
    sql = "UPDATE hammocks SET booked=true, booked_by_user_id='#{user_id}' WHERE id='#{@id}' RETURNING booked"
    if DatabaseConnection.query(sql).first['booked'] == 't'
      return true
    else
      return false
    end
  end
end


#Book BUtton ----> Router ---> HammockNDrinks ------> SpaceHammock -------> Database Connection --------> Database Hammocks, Users

# Router ------> HammockNDrinks (.all -----> Space Hammock)   --------> Database Connection ------ Database
#        ------> Space Hammock     --------> Database Connection ------ Database


# Router/hammack_drinks ------> Space Hammock     --------> Database Connection ------ Database   being booked
#                       ------> User     --------> Database Connection ------ Database     post hammock
