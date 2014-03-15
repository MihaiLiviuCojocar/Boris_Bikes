require "./lib/docking_station"
require "./lib/bike"

describe "Docking station" do

  let(:bike)    { Bike.new           }
  let(:station) { DockingStation.new(:capacity => 20) }

  it "should accept a bike" do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

  it "should be able to release a bike" do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(station).not_to be_full
    fill_station(station)
    expect(station).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_station(station)
    expect { station.dock(Bike.new) }.to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do
    working_bike = Bike.new
    broken_bike  = Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bike).to eq([working_bike])
  end

end

def fill_station(station)
  20.times { station.dock(Bike.new) }
end