class DockingStation
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity, :bike_list

  def initialize
    @bike_list = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bike_list.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bike_list.push(bike)
  end

  def dock_from_van(van_storage)
    @bike_list = []
    van_storage.each do |bike|
      dock(bike)
    end
  end
  private

  def full?
    @bike_list.count >= capacity
  end

  def empty?
    @bike_list.empty?
  end

end

class Bike
  attr_accessor :broken
  def initialize
    @broken = false
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end
end

class Van
  attr_accessor :van_storage
  def initialize
    @van_storage = []
  end
  def add_bike(bikes)
    bikes.each do |bike|
      if bike.broken?
        van_storage << bike
      end
    end
  #  van_storage << bikes
  end
  def get_bikes_from_garage(bikes)
    van_storage = []
    bikes.each do |bike|
      van_storage << bike
    end
  end
end

class Garage
  attr_accessor :garage_storage
  def initialize
    @garage_storage = []
  end
  def get_bikes_from_van(van_storage)
    van_storage.each do |bike|
      garage_storage << bike
    end
  end
  def fix
    garage_storage.each do |bike|
      bike.broken = false
    end
  end
end
