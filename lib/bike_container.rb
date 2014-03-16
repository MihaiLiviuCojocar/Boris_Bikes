module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike)
    raise "Can't release this bike because it's not here !" unless bikes.include?(bike)
    raise "Sorry ! This bike cannot be released because it's broken" if bike.broken?
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def empty?
    bike_count == 0
  end

  def available_bikes
    bikes.reject {|bike| bike.broken? }
  end

  def broken_bikes
    # bikes.select { |bike| bike.broken? }
    bikes - available_bikes
  end

end