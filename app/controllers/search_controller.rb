class SearchController < ApplicationController
  
  def sku_find
    object = (Barcode.find(:first, :conditions => ['sku = ?', params[:search][:sku]])).barcodeable
    redirect_to(object)
  end
  
 
  
end
