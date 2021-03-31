require 'space_hammock'

describe SpaceHammock do
  let (:test_hammock) { SpaceHammock.new(1, 'test_hammock', 'its a nice hammock', 1000, 1, false, nil) }
    let(:new_hammock) { SpaceHammock.new(2,'Sharkie', 'coolest hammock', '1000', 2) }

    it 'initializes SpaceHammock with name, description, price per night, owner_id' do
      expect(new_hammock.name).to eq('Sharkie')
      expect(new_hammock.description).to eq('coolest hammock')
      expect(new_hammock.price_per_night).to eq('1000')
      expect(new_hammock.owner_id).to eq(2)
    end

  describe '.create' do
    it 'creates a space hammock' do
      sql = "INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('test_name', 'test_description', 50, 1);"
      expect(DatabaseConnection).to receive(:query).with(sql)
      SpaceHammock.create('test_name', 'test_description', 50, 1)
    end
  end

  describe '.find' do
    it 'find a space-hammock based on the id from the database and creates it as an instance of space Hammock' do
      SpaceHammock.create('test_name', 'test_description', 50, 1)
      expect(SpaceHammock.find("1").id).to eq "1"
    end
  end

  describe '#book' do
    before do
      SpaceHammock.create('test_name', 'test_description', 50, 1)
    end

    context 'if the space hammock is not booked, it returns true and updates the database' do
      it 'takes a space hammock instance and books it, changing the databse table to say it is booked and by who' do
        expect(test_hammock.book(1)).to be true
      end
    end

    context 'if the space hammock is already booked, it returns false' do
      it do
        test_hammock.book(1)
        expect(test_hammock.book(1)).to be false
      end
    end
  end

  describe '.all' do
    let(:sharkie_hammock) { 'Sharkie' }
    let(:kwaka_hammock) { 'Kwakie' }

    it 'has an array of space hammocks' do
      PG.connect(dbname: 'makers_hnd_database_test')
      hammocks = SpaceHammock.all
      expect(hammocks).to be_kind_of(Array)
    end

    it 'lists all hammocks' do
      connection = PG.connect(dbname: 'makers_hnd_database_test')
      connection.exec("INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('Sharkie', 'very cool', '1000.00', 1);")
      hammocks = SpaceHammock.all
      expect(hammocks).to eq ([{:id=> '1', :name => "Sharkie", :description => "very cool", :price_per_night => "1000.00"}])
    end
  end
end
