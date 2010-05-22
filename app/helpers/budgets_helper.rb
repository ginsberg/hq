module BudgetsHelper
  
  def budget_account_total(account_id, period)
    account = Account.find(account_id)
    transactions = Transaction.find(:all, :conditions => ['account_id = ? and period_id = ?', account_id, period.id])
    total = transactions.sum(&:amount)
    return total
  end
  
  def budget_to_pay_total(account_id, period)
    account = Account.find(account_id)
    transactions = Transaction.find(:all, :conditions => ['account_id = ? and period_id = ? and payment_date is ?', account_id, period.id, nil])
    total = transactions.sum(&:amount)
    return total
  end
  
end
