require "./lib/bike_container"

class Van

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def release(bike, docking_station)
    bikes.delete(bike)
    docking_station.dock(bike)
  end

end