class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize
    @bike_list = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bike_list.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bike_list.push(bike)
  end


  private

  def full?
    @bike_list.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bike_list.empty?
  end

end

class Bike

  def working?
    return true
  end

end
