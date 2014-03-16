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

end