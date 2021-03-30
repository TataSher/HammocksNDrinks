class HammocksNDrinks

attr_reader :all_space_hammocks

  # def initialize
  #   @all_space_hammocks = []
  # end

  def self.add(hammock)
    @all_space_hammocks = []
    @all_space_hammocks << hammock
  end

  def self.all
    @all_space_hammocks
  end

end
