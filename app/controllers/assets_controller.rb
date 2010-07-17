class AssetsController < ApplicationController
  
  before_filter :login_required
  auto_complete_for :tag, :name
  in_place_edit_for :asset, :name
  in_place_edit_for :asset, :description
  
  navigation :assets
  
  
 def index
    @assets = Asset.all
    @assetCount = Asset.count
    @scanCount = Scan.count
    @locationCount = Location.count
    @tags = Asset.tag_counts
    @latestAssets = Asset.find(:all, :limit => 9, :order => 'created_at DESC')
    @featuredAsset = Asset.find(:first, :conditions => [''], :order => "RAND()")
    @latestSets = Location.find(:all, :conditions => ['category = 4'], :limit => 4 )
    render :layout => "fixed"
  end
  
  def show
    @asset = Asset.find(params[:id])
  end
  
  def new
    @asset = Asset.new
  end
  
  def create
    @asset = Asset.new(params[:asset])
    if @asset.save
      flash[:notice] = "Successfully created asset."
      redirect_to @asset
    else
      render :action => 'new'
    end
  end
  
  def edit
    @asset = Asset.find(params[:id])
  end

  
  def update
    @asset = Asset.find(params[:id])
    # Add the tags from tag form
    @asset.tag_list.add(params[:tag][:name])
    if @asset.update_attributes(params[:asset])
      flash[:notice] = "Successfully updated asset."
      respond_to do |format|  
        format.html { redirect_to asset_path(@asset) }  
        format.js
      end
    else
      render :action => 'edit'
    end
  end
  
  def tag
    @assets = Asset.find_tagged_with(params[:id])
    flash[:notice] = "Below are your search results for <strong>#{params[:id]}</strong>"
  end
  
  def remove_tag
     @asset = Asset.find(params[:id])
      # Remove the tag
      @asset.tag_list.remove(params[:tag])
      if @asset.save
        respond_to do |format|  
          format.html { redirect_to asset_path(@asset) }  
          format.js
        end
      else
        render :action => 'edit'
      end
    end
    
    def rate
        @asset = Asset.find(params[:id])
        @asset.rate(params[:stars], current_user, params[:dimension])
        render :update do |page|
          page.replace_html @asset.wrapper_dom_id(params), ratings_for(@asset, params.merge(:wrap => false))
          page.visual_effect :highlight, @asset.wrapper_dom_id(params)
        end
      end
    
  
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    flash[:notice] = "Successfully destroyed asset."
    redirect_to assets_url
  end
end
