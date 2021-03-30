require 'hammocks_n_drinks'

describe HammocksNDrinks do
  let(:sharkie_hammock) { 'Sharkie' }
  let(:kwaka_hammock) { 'Kwakie' }

  it 'has an array of space hammocks' do
    hammocks = HammocksNDrinks.add(sharkie_hammock)
    hammocks = HammocksNDrinks.all
    expect(hammocks).to be_kind_of(Array)
  end

  # it 'has a list of space hammocks' do
  #   hammocks = HammocksNDrinks.add(sharkie_hammock)
  #   expect(HammocksNDrinks.all_space_hammocks).to eq(['Sharkie'])
  # end

  describe '.all' do
    it 'lists all hammocks' do
      hammocks = HammocksNDrinks.add(sharkie_hammock)
      hammocks = HammocksNDrinks.all
      expect(hammocks).to eq (['Sharkie'])
    end
  end

end
