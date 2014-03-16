require "./lib/bike_container"

class Garage

  include BikeContainer

  def dock(bike)
    bikes << bike
    bike.fix
  end

  def release(bike, van)
    bikes.delete(bike)
    van.dock(bike)
  end

end