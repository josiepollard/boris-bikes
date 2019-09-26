require './lib/DockingStation'
describe DockingStation do
  it 'release_bike' do
    dock = DockingStation.new
    expect(dock.release_bike).to be_instance_of Bike
  end
  it 'release_bike working bike' do
    dock = DockingStation.new
    expect((dock.release_bike).working?).to eq (true)
  end
end
