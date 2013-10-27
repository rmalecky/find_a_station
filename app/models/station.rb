class Station
  include Mongoid::Document
  require 'csv'
  
  
  field :station_id, type: Integer 
  field :name, type: String
  field :location, type: Array #for mongodb use lon/lat
  
  index({location: '2d'}) 
  
  validates_presence_of :station_id
  validates_uniqueness_of :station_id
  validates_numericality_of :station_id
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :location
  validates_uniqueness_of :location
  
  def self.load_GTFS_stops(file_path)
    stops = CSV.foreach(file_path, {headers: true}) do |row|
      Station.create!(
        station_id: row['stop_id'],
        name: row['stop_name'],
        location: [row['stop_lon'].to_f,row['stop_lat'].to_f]
      )
    end
  end
  
  def self.nearest(location)
    Station.geo_near([location[1],location[0]]).first
  end
  
end
