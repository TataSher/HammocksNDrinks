require 'pg'
require 'space_hammock'

class HammocksNDrinks
  def self.create(name, description, price_per_night)
    SpaceHammock.create(name, description, price_per_night)
  end
end
