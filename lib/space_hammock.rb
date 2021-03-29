class SpaceHammock
  attr_reader :name, :description, :price_per_night, :owner
  
  def initialize(name, description, price_per_night, owner)
    @name = name
    @description = description
    @price_per_night = price_per_night
    @owner = owner
  end

end
