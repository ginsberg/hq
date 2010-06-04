class Asset < ActiveRecord::Base
  
  belongs_to :location
  has_many :barcodes, :as => :barcodeable
  has_many :scans 
  
  acts_as_taggable
  ajaxful_rateable :stars => 5, :dimensions => [:quality], :allow_update => true
  accepts_nested_attributes_for :scans, :allow_destroy => true
  
  after_create :generate_barcode
  
  acts_as_list :scope => :location
  
  
  private
  
  def generate_barcode
    sku = "1%07d" % self.id.to_i
    self.barcodes << Barcode.create(:sku => sku)
  end
  
end
