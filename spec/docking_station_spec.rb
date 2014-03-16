require "./lib/docking_station"
require "./lib/bike"

describe "Docking station" do

  it "should allow setting default capacity when initialized" do
    station = DockingStation.new(:capacity => 123)
    expect(station.capacity).to eq(123)
  end

  it "should know when it's empty" do
    station = DockingStation.new
    expect(station).to be_empty
  end

end