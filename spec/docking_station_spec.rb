require "./lib/docking_station"
require "./lib/bike"
require "./lib/van"

describe "Docking station" do

  let(:bike)    { Bike.new           }
  let(:station) { DockingStation.new }
  let(:van)     { Van.new }

  it "should allow setting default capacity when initialized" do
    station = DockingStation.new(:capacity => 123)
    expect(station.capacity).to eq(123)
  end

  it "should know when it's empty" do
    expect(station).to be_empty
  end

  it "should not release a bike for rent if it's broken" do
    bike.break
    station.dock(bike)
    expect { station.release(bike) }.to raise_error(RuntimeError)
  end

  it "should release a broken bike only to a van" do
    bike.break
    station.dock(bike)
    expect(station.broken_bikes).to eq([bike])
    expect { station.release(bike) }.to raise_error(RuntimeError)
    station.release_broken_bike(bike,van)
    expect(station.broken_bikes).to eq([])
    expect(van.bikes).to eq([bike])
  end

end