require_relative './bike.rb'

class DockingStation
  attr_reader :working_bikes, :capacity # Shorthand for def bike
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @working_bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty? # empty? is a private class method.
    @working_bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full? 
    #if @working_bikes.count >= 20
    if bike.broken == true
      @broken_bikes << bike
    else
      @working_bikes << bike
    end
  end

  def spaces_left
    @capacity - @working_bikes.count - @broken_bikes.count
  end

  private
  
  def full?
    @working_bikes.count + @broken_bikes.count >= @capacity
  end

  def empty?
    @working_bikes.count == 0
  end 
end


