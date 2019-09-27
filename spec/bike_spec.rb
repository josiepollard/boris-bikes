require './lib/DockingStation'
describe Bike do
  it 'bike working' do
    dock = Bike.new
    expect(dock).to respond_to :broken?
  end
end
