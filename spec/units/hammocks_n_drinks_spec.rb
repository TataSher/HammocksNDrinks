require 'hammocks_n_drinks'

describe HammocksNDrinks do
  let(:sharkie_hammock) { 'Sharkie' }
  let(:kwaka_hammock) { 'Kwakie' }

  it 'has an array of space hammocks' do
    connection = PG.connect(dbname: 'makers_hnd_database_test')
    hammocks = HammocksNDrinks.all
    expect(hammocks).to be_kind_of(Array)
  end

  describe '.all' do
    it 'lists all hammocks' do
      connection = PG.connect(dbname: 'makers_hnd_database_test')
      connection.exec("INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('Sharkie', 'very cool', '1000.00', 1);")
      hammocks = HammocksNDrinks.all
      expect(hammocks).to eq ([{:name => "Sharkie", :description => "very cool", :price_per_night => "1000.00"}])
    end
  end


  describe '.book' do
    it 'books a space hammock for user' do
      expect(HammocksNDrinks.book(1,1).booked?).to eq True
    end
  end

end

TEST_DESCRIPTION = "Enjoy your luxury holiday on the idyllic planet of Neptune, at Neptune Blues you can while your worries away while drinking our famous Gas Seas Sparkling Methane."
