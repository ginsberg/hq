class BarcodesController < ApplicationController
  
  before_filter :login_required
  
  def index
    @location = Location.find(params[:location_id])
    @assets = @location.assets
  end
  
  
end
