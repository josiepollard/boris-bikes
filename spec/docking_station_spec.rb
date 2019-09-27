require './lib/DockingStation'
describe DockingStation do
  it 'release_bike' do
    dockk = DockingStation.new
    dockk.dock(0)
    expect { raise dockk.release_bike}.to raise_error
  end

  it 'release_bike working bike' do
    dockk = DockingStation.new
    dockk.dock(Bike.new)
    expect((dockk.release_bike).working?).to eq (true)
  end

  it 'dock 20 bikes' do
    DockingStation::DEFAULT_CAPACITY.times do
      subject.dock Bike.new
    end
    expect { subject.dock Bike.new }.to raise_error 'Docking station full'
  end
end
