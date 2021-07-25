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

  it { is_expected.to respond_to(:bikes) }

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

  it 'raise an error when docking a bike on a full dock' do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error("Dock is full!")
  end
end

# finishing this off next week 