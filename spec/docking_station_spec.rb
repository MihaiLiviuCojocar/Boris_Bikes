require "./lib/docking_station"
require "./lib/bike"

describe "Docking station" do

  let(:bike)    { Bike.new           }
  let(:station) { DockingStation.new }

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

end