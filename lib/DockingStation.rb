class DockingStation
  attr_reader :bike

  def initialize
    @bike_list = []
  end

  def release_bike
    fail 'No bikes available' if @bike_list.empty?
    @bike_list.pop
  end

  def dock(bike)
    fail 'Docking station full' if @bike_list.count > 19
    @bike_list.push(bike)
  end

  def bike
  end

end

class Bike

  def working?
    return true
  end

end
