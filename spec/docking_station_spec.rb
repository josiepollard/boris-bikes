require './lib/DockingStation'
describe DockingStation do
  it 'release_bike' do
    dockk = DockingStation.new
    dockk.dock(0)
    expect { raise dockk.release_bike}.to raise_error
  end
  it "it can dock a fixed bike from the van" do
    broken_bike = Bike.new
    garage = Garage.new
    van = Van.new
    subject.dock(broken_bike)
    broken_bike.report_broken
    docking_storage = subject.bike_list
    van.add_bike(docking_storage)
    vans_storage = van.van_storage
    garage.get_bikes_from_van(vans_storage)
    garage.fix
    garage_storage_fixed = garage.garage_storage
    van.get_bikes_from_garage(garage_storage_fixed)
    vans_storage = van.van_storage
    subject.dock_from_van(vans_storage)
    docking_storage = subject.bike_list
    expect(docking_storage).to eq(vans_storage)
  end

  it 'release_bike working bike' do
    dockk = double(:bike, broken?: false)
    subject.dock(dockk)
    expect(subject.release_bike).to be dockk
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

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double :bike }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end
  end
end

 describe Van do
   it 'add a broken bike' do
     docking_station = DockingStation.new
     broken_bike = Bike.new
     docking_station.dock(broken_bike)
     broken_bike.report_broken
     docking_storage = docking_station.bike_list
     subject.add_bike(docking_storage)
     expect(subject.van_storage).to include(broken_bike)
   end
   it "can get the bikes from the garage" do
     docking_station = DockingStation.new
     broken_bike = Bike.new
     garage = Garage.new
     docking_station.dock(broken_bike)
     broken_bike.report_broken
     docking_storage = docking_station.bike_list
     subject.add_bike(docking_storage)
     vans_storage = subject.van_storage
     garage.get_bikes_from_van(vans_storage)
     garage.fix
     garage_storage_fixed = garage.garage_storage
     subject.get_bikes_from_garage(garage_storage_fixed)
     vans_storage = subject.van_storage
     expect(vans_storage).to eq(garage_storage_fixed)
   end
end

describe Garage do

  it "moves bikes into garage" do
    the_van = Van.new
    docking_station = DockingStation.new
    broken_bike = Bike.new
    docking_station.dock(broken_bike)
    broken_bike.report_broken
    docking_storage = docking_station.bike_list
    the_van.add_bike(docking_storage)
    vans_storage = the_van.van_storage
    subject.get_bikes_from_van(vans_storage)
    expect(subject.garage_storage).to eq(vans_storage)
  end
  it "it can fix bikes" do
    the_van = Van.new
    docking_station = DockingStation.new
    broken_bike = Bike.new
    docking_station.dock(broken_bike)
    broken_bike.report_broken
    docking_storage = docking_station.bike_list
    the_van.add_bike(docking_storage)
    vans_storage = the_van.van_storage
    subject.get_bikes_from_van(vans_storage)
    subject.fix
    subject.garage_storage.each do |bike|
      status = bike.broken?
      expect(status).to eq(false)
    end
  end
end
