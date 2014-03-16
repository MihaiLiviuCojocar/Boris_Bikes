require "./lib/bike_container"
require "./lib/bike"

class ContainerHolder
  include BikeContainer
end

describe "BikeContainer" do

  let(:bike)   { Bike.new            }
  let(:holder) { ContainerHolder.new }

  it "should accept a bike" do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it "should be able to release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it "should know when it's full" do
    expect(holder).not_to be_full
    fill_station(holder)
    expect(holder).to be_full
  end

  it "should not accept a bike if it's full" do
    fill_station(holder)
    expect { holder.dock(Bike.new) }.to raise_error(RuntimeError)
  end

  it "should provide the list of available bikes" do
    working_bike = Bike.new
    broken_bike  = Bike.new
    broken_bike.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it "should provide the list of broken bikes" do
    working_bike = Bike.new
    broken_bike  = Bike.new
    broken_bike.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.broken_bikes).to eq([broken_bike])
  end

  it "should not be able to release a bike that it's not docked there" do
    expect { holder.release(bike) }.to raise_error(RuntimeError)
  end

  it "should know if the argument is not given" do
    expect { holder.release }.to raise_error(ArgumentError)
    expect { holder.dock }.to raise_error(ArgumentError)
  end

  it "should know if the argument passed is not a bike" do
    expect { holder.dock(plane) }.to raise_error(NameError)
  end

end

def fill_station(holder)
  holder.capacity.times { holder.dock(Bike.new) }
end
