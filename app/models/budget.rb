class Budget < ActiveRecord::Base
  attr_accessible :name, :master, :period_id
  
  has_many :transactions, :dependent => :destroy
  belongs_to :period
  
  
  def self.budget_total(budget)
    transactions = budget.transactions
    return transactions.sum(:amount)
  end
  
  def self.budget_surplus(budget)
    transactions = budget.transactions.sum(:amount)
    wages = budget.wages
    surplus =  wages - transactions
    return surplus
  end
  
  
end
