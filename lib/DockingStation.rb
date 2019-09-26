class DockingStation
  attr_reader :bike
  def release_bike
    return bike = Bike.new
  end
end

class Bike
  def working?
    return true
  end
end
