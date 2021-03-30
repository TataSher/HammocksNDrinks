require 'space_hammock'

describe SpaceHammock do
  let (:test_hammock) { SpaceHammock.new(1, 'test_hammock', 'its a nice hammock', 1000, 1, false, nil) }

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
      sql = "SELECT * FROM hammocks WHERE id='1';"
      # expect(DatabaseConnection).to receive(:query).with(sql)
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
end
