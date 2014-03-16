require "./lib/docking_station"
require "./lib/bike"

describe "Docking station" do

  it "should allow setting default capacity when initialized" do
    station = DockingStation.new(:capacity => 123)
    expect(station.capacity).to eq(123)
  end

end