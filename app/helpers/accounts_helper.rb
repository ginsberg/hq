module AccountsHelper
  
  def account_balance(account_id, period)
    account = Account.find(account_id)
    transactions = Transaction.find(:all, :conditions => ['account_id = ? and transaction_date < ? and payment_date is not ?', account_id, period.finish, nil])
    balance = transactions.sum(&:amount)
    return balance
  end
  
  
  
  
end
