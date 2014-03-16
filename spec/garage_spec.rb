require "./lib/garage"
require "./lib/bike"
require "./lib/van"

describe "Garage" do

  let(:garage) { Garage.new }
  let(:bike)   { Bike.new   }
  let(:van)    { Van.new    }

  it "should be able to fix a bike" do
    bike.break
    expect(bike).to be_broken
    garage.dock(bike)
    expect(bike).not_to be_broken
  end

  it "should release a bike only to a van" do
    garage.dock(bike)
    expect(garage.bikes).to eq([bike])
    garage.release(bike, van)
    expect(garage.bikes).to eq([])
    expect(van.bikes).to eq([bike])
  end

end