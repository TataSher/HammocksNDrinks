require_relative 'space_hammock'

class HammocksNDrinks
  def self.create(name, description, price_per_night, owner_id)
    SpaceHammock.create(name, description, price_per_night, owner_id)
    name
  end
end
