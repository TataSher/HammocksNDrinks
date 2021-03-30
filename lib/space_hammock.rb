require_relative 'database_connection'

class SpaceHammock
  attr_reader :name, :description, :price_per_night, :owner

  def initialize(id, name, description, price_per_night, owner_id, booked, booked_by_user_id)
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

  def self.find(hammock_id)

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
