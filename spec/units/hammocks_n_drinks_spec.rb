require 'hammocks_n_drinks'

describe HammocksNDrinks do
  describe '.create' do
    it 'creates an entry into the space hammock table in the database via the space hammock class' do
      expect(HammocksNDrinks.create('Neptune Blues',TEST_DESCRIPTION,'1000', 1)).to eq 'Neptune Blues'
    end
  end
end

TEST_DESCRIPTION = "Enjoy your luxury holiday on the idyllic planet of Neptune, at Neptune Blues you can while your worries away while drinking our famous Gas Seas Sparkling Methane."
