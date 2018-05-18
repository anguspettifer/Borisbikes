require "docking_station"

describe DockingStation do

  it "allows a user to set a capacity" do
    station = DockingStation.new(15)
    expect(station.capacity).to eq 15
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "checks default capacity is 20" do
    station = DockingStation.new
    expect(station.capacity).to eq 20
  end

  describe "#release_bike" do
    it "releases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe "#dock" do
     it "raises an error if the station is full" do
       subject.capacity.times { subject.dock(Bike.new) }
       expect { subject.dock(Bike.new) }.to raise_error "Docking station full"
     end

     it "reports bike as broken when broken bike is returned" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike.working?).to be false
     end
  end

end