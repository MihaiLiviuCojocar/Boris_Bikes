require "./lib/docking_station"
require "./lib/bike"

describe "Docking station" do

  it "should accept a bike" do
    bike = Bike.new
    station = DockingStation.new
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

  it "should be able to release a bike" do
    bike = Bike.new
    station = DockingStation.new
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

end