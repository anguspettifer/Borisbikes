require_relative 'bike'

class DockingStation
  attr_reader :bikes

  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail "Can't release bike, it's broken." unless @bikes.last.working?
    @bikes.pop
  end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
