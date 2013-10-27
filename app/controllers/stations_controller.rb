class StationsController < ApplicationController
  def show
    @station = Station.nearest([params['latitude'], params['longitude']])
    
    render partial: @station
  end
end
