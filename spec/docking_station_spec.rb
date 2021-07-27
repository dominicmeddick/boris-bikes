require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike } 

  it 'get bike and check if bike is working' do
    bike_full = Bike.new
    subject.dock(bike_full)
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end
  
  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[-1]).to eq bike
  end

  it 'raises an error when releasing bike on an empty dock' do
    expect { subject.release_bike }.to raise_error("no bikes in docking station")
  end

  it 'raises an error when full' do
    bike = Bike.new
    subject.capacity.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error("Docking station full")
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end 
end
