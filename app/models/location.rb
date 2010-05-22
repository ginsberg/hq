class Location < ActiveRecord::Base
  acts_as_tree :order => "name"
  attr_accessible :parent_id, :name
  
  has_many :assets
end
