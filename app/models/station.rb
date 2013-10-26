class Station
  include Mongoid::Document
  
  field :name, type: String
  field :location, type: Array
  
  index({location: '2d'}) 
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :location
  validates_uniqueness_of :location
  
end
