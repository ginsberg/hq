class Period < ActiveRecord::Base
  attr_accessible :name, :start, :finish
  
  has_one :budget
  has_one :debt
  
end
