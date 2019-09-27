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
    expect((dockk.release_bike).broken?).to eq(false)
  end

  it 'dock 20 bikes' do
    subject.capacity.times do
      subject.dock Bike.new
    end
    expect { subject.dock Bike.new }.to raise_error 'Docking station full'
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end
