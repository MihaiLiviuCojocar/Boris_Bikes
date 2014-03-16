require "./lib/van"
require "./lib/bike"
require "./lib/docking_station"

describe "Van" do

  let(:van)     { Van.new            }
  let(:bike)    { Bike.new           }
  let(:station) { DockingStation.new }

  it "should allow setting default capacity when initialized" do
    van = Van.new(:capacity => 5)
    expect(van.capacity).to eq(5)
  end

  it "should relese a bike to a docking station or garage" do
    van.dock(bike)
    expect(van.bikes).to eq([bike])
    van.release(bike, station)
    expect(van.bikes).to eq([])
    expect(station.bikes).to eq([bike])
  end

end