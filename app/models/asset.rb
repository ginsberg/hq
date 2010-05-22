class Asset < ActiveRecord::Base
  
  belongs_to :location
  
  acts_as_taggable
  ajaxful_rateable :stars => 10, :dimensions => [:quality], :allow_update => true
  
  has_many :scans
  accepts_nested_attributes_for :scans, :allow_destroy => true
end
