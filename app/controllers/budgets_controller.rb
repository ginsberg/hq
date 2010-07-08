class BudgetsController < ApplicationController
  
  before_filter :login_required
  before_filter :current_period
  
 
   def show
     @period = Period.find(params[:period_id])
     @transaction = Transaction.new
     @accounts = Account.find(:all, :conditions => ['debt is ?', nil])
     @budget_total = Budget.budget_total(@period.budget)
     @budget_surplus = Budget.budget_surplus(@period.budget)
  end
  
private
  
  def pre_period_balance(period_id)
    if period_id > 1
      pre_period_id = period_id -1
    else
      pre_period_id = period_id
    end
    period = Period.find(pre_period_id)
    transactions = Transaction.find(:all, :conditions => ['transaction_date < ? and payment_date is not ?', period.finish, nil])
    return transactions.sum(&:amount)
  end
  
  def period_balance(period_id)
     period = Period.find(period_id)
     transactions = Transaction.find(:all, :conditions => ['transaction_date < ? and payment_date is not ?', period.finish, nil])
     return transactions.sum(&:amount)
  end
  
  
  
end
