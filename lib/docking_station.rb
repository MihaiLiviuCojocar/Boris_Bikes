class DockingStation

  DEFAULT_CAPACITY = 10

  def initialize(capacity = {})
    @capacity = capacity.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes    = []
  end

  def bike_count
    @bikes.count
  end

  def dock(bike)
    @bikes << bike
  end

  def release(bike)
    @bikes.delete(bike)
  end

  def full?
    bike_count == @capacity
  end

end