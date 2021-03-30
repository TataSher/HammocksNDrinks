require 'space_hammock'

describe SpaceHammock do
  let(:new_hammock) { SpaceHammock.new('Sharkie', 'coolest hammock', '1000', 'Lou') }
  it 'initializes SpaceHammock with name, description, price per night, owner' do
    expect(new_hammock.name).to eq('Sharkie')
    expect(new_hammock.description).to eq('coolest hammock')
    expect(new_hammock.price_per_night).to eq('1000')
    expect(new_hammock.owner).to eq('Lou')
  end

end
