require 'spec_helper'

describe Station do
  let(:data) { Rails.root.join("spec", "models", "stops_test.txt")}
   
  it { should validate_presence_of(:station_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_uniqueness_of(:station_id) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:location) }
  it { should validate_numericality_of(:station_id) }
  
  it { should have_index_for(location: '2d') }
  
  it "should import CSV data and create stations in the DB" do
    Station.load_GTFS_stops(data)
    expect(Station.count).to eq(13)
    expect(Station.first.name).to eq("World Trade Center")
  end
  
  it "should return the closest station give a location" do
    Station.load_GTFS_stops(data)
    Station.create_indexes
    expect(Station.nearest([40.71271,-74.01199]).name).to eq("World Trade Center")
  end
    
end
