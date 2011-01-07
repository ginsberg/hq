class LocationsController < ApplicationController
  
  navigation :assets
  before_filter :login_required
  
  def index
    @locations = Location.find(:all, :conditions => ['parent_id is ?', nil])
  end
  
  def show
    @location = Location.find(params[:id])
    @assets = @location.assets.paginate :all, :page => params[:page], :order => 'created_at DESC'
    
  end
  
  def new
    @location = Location.new
  end
  
  def create
    @location = Location.new(params[:location])
    if @location.save
      flash[:notice] = "Successfully created location."
      redirect_to @location
    else
      render :action => 'new'
    end
  end
  
  def edit
    @location = Location.find(params[:id])
  end
  
  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
      flash[:notice] = "Successfully updated location."
      redirect_to @location
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:notice] = "Successfully destroyed location."
    redirect_to locations_url
  end
end
