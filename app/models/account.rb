class Account < ActiveRecord::Base
  attr_accessible :name
  
  has_many :transactions
  has_many :payments
end
