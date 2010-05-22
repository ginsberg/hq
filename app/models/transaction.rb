class Transaction < ActiveRecord::Base
  
  belongs_to :account
  belongs_to :budget
  belongs_to :debt
  belongs_to :category
  
  default_scope :order => 'transaction_date ASC'
  
  named_scope :category, lambda { |period, category| {:conditions => ['category_id = ? and period_id =?', category, period]} }
  named_scope :period, lambda { |period| {:conditions => ['transaction_date >= ? and transaction_date <=  ?', period.start, period.finish]} }
  named_scope :budget_scope, lambda { |period| {:conditions => ['budget_id =?', period]} }
  named_scope :posted, :conditions => ['payment_date is not ?', nil]
  named_scope :unposted, :conditions => ['payment_date is ?', nil]
  named_scope :positive, :conditions => ['amount > 0']
  named_scope :negative, :conditions => ['amount < 0']
  
  
  
  
end
