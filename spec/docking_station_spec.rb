require './lib/DockingStation'
describe DockingStation do
  it 'release_bike' do
    dockk = DockingStation.new
    dockk.dock(0)
    expect { raise dockk.release_bike}.to raise_error
  end

  it 'release_bike working bike' do
    dockk = DockingStation.new
    dockk.dock(10)
    expect((dockk.release_bike).working?).to eq (true)
  end
end
