class BarcodesController < ApplicationController
  
  
  def index
    @location = Location.find(params[:location_id])
    @assets = @location.assets
  end
  
  
end
