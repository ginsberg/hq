class DebtsController < ApplicationController
  
  before_filter :login_required
  before_filter :sidebar, :current_period
  
  
  def show
     @debt = @period.debt
     @transaction = Transaction.new
     @categories = Category.find(:all)
     @period_balance = period_balance(@period.id)
     @accounts = Account.find(:all, :conditions => ['debt = ?', true])
     @pre_bal_diff = period_balance(@period.id) - pre_period_balance(@period.id)
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
     transactions = Transaction.find(:all, :joins => :account, :conditions => ['transaction_date < ? and payment_date is not ? and accounts.debt = 1', period.finish, nil])
     return transactions.sum(&:amount)
  end
  
end


