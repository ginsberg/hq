class Location < ActiveRecord::Base
  acts_as_tree :order => "name"
  attr_accessible :parent_id, :name, :category, :description, :short_description  
  has_many :barcodes, :as => :barcodeable
  
  has_many :assets
  after_create :generate_barcode
  
  private 
  
  def generate_barcode
     sku = "2%07d" % self.id.to_i
     self.barcodes << Barcode.create(:sku => sku)
   end
end
