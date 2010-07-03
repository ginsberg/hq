class ScansController < ApplicationController
 
  before_filter :login_required
  
  def index
    @scans = Scan.all
  end
  
  def show
    @scan = Scan.find(params[:id])
  end
  
  def new
    @scan = Scan.new
  end
  
  def create
    @scan = Scan.new(params[:scan])
    if @scan.save
      flash[:notice] = "Successfully created scan."
      redirect_to @scan
    else
      render :action => 'new'
    end
  end
  
  def edit
    @scan = Scan.find(params[:id])
  end
  
  def update
    @scan = Scan.find(params[:id])
    if @scan.update_attributes(params[:scan])
      flash[:notice] = "Successfully updated scan."
      redirect_to @scan
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @scan = Scan.find(params[:id])
    @scan.destroy
    flash[:notice] = "Successfully destroyed scan."
    redirect_to scans_url
  end
end
