require 'space_hammock'

describe SpaceHammock do
  describe '.create' do
    it 'creates a space hammock' do
      sql = "INSERT INTO hammocks (name, description, price_per_night, user_id) VALUES ('test_name', 'test_description', 50, 1);"
      expect(PG).to receive(:exec).with(sql)
      SpaceHammock.create('test_name', 'test_description', 50, 1)
    end
  end


end
