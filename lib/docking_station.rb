require_relative './bike.rb'

class DockingStation
  attr_reader :bikes, :capacity # Shorthand for def bike
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty? # empty? is a private class method.
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full? 
    #if @bikes.count >= 20
    @bikes << bike
  end

  private
  
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty? 
  end 
end


