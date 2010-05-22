class Debt < ActiveRecord::Base
  attr_accessible :name, :period_id
  
  belongs_to :period
  has_many :outgoings
  has_many :payments
  has_many :transactions
  
  
end
