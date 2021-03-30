require 'pg'
require 'space_hammock'

class HammocksNDrinks
  def self.create(name, description, price_per_night, user_id)
    SpaceHammock.create(name, description, price_per_night, user_id)
  end
end
