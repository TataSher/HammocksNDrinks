require './lib/database_connection'

class HammocksNDrinks

# attr_reader :all_space_hammocks

#   def initialize
#     @all_space_hammocks = []
#   end


  def self.all
    all_space_hammocks = []
    connect = DatabaseConnection.setup
    result = connect.exec "SELECT * FROM hammocks"
		result.map do |hammock|
          all_space_hammocks << {:name => "#{hammock['name']}", :description => "#{hammock['description']}", :price_per_night => "#{hammock['price_per_night']}"}
		end
    all_space_hammocks
  end

  # feels like duplication of SpaceHammock.create??
    # def self.create(name, description, price_per_night, owner_id)
    #   hammock = SpaceHammock.create(name, description, price_per_night, owner_id)
    #   name
    # end

end
