require "docking_station"

describe DockingStation do

  let(:bike) { double :bike }

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
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it "raises an error when trying to release a broken bike" do
      allow(bike).to receive(:report_broken)
      bike.report_broken
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "Can't release bike, it's broken."
    end

  end

  describe "#dock" do
     it "raises an error if the station is full" do
       subject.capacity.times { subject.dock(double(:bike)) }
       expect { subject.dock(double(:bike)) }.to raise_error "Docking station full"
     end

     it "reports bike as broken when broken bike is returned" do
      allow(bike).to receive(:report_broken)
      allow(bike).to receive(:working?).and_return(false)
      bike.report_broken
      subject.dock(bike)
      expect(subject.bikes.last.working?).to be false
     end
  end

end
