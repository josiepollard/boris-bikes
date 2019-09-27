class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

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


  private

  def full?
    @bike_list.count >= capacity
  end

  def empty?
    @bike_list.empty?
  end

end

class Bike

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

end

class Garage

end
