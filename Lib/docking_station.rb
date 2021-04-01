require_relative 'bike'

class DockingStation  
  attr_reader :bike

  def empty?
    @bike == nil
  end

  def full?
    @bike != nil
  end

  def release_bike
    if empty?
      raise "no bikes in docking station"
    else
      return Bike.new
    end
  end
  
  def dock(bike)
    if full?
      raise "Dock is full!"
    else
      @bike = bike
    end
  end
end
