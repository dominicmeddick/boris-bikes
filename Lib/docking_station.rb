require_relative 'bike'

class DockingStation  
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def empty?
    @bikes == []
  end

  def full?
    @bikes.length >= 20
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
      @bikes.push(bike)
      return bike
    end
  end
end
