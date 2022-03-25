require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it "releases a bike" do
      bike = double(:broken => false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "Should stop broken bikes from being released" do
      bike = double(:broken => true)
      bike2 = double(:broken => false)
      subject.dock(bike2)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike2 
    end
  end

  describe '#docking capacity check' do
   it 'allows user to set the docking station capacity' do
    capacity = 30
    docking_station = DockingStation.new(capacity)
    expect(docking_station.capacity).to eq capacity
   end
  
    it 'checks that the docking station capacity is set to default 20' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end
  
  describe '#dock' do
    it 'raises an error when full' do
      bike = double(:broken => false)
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock bike }.to raise_error 'Docking station full'
    end
  end

  it 'raises an error when there are no bikes available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:working_bikes) }

  it "docks something" do
    expect(subject.dock(double(:broken => false))).not_to be_empty
  end

  it "returns docked bikes" do
    bike = double(:broken => false)
    subject.dock(bike)
    expect(subject.working_bikes).not_to be_empty
  end

  it "should accept all bikes" do
    bike = double(:broken => true)
    subject.dock(bike)
    expect(subject.spaces_left).to eq 19
  end
end