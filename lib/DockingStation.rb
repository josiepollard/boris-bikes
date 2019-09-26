class DockingStation
  attr_reader :bike

  def release_bike
    fail unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
  end

  def bike
  end

end

class Bike

  def working?
    return true
  end

end
