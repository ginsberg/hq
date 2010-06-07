class PeriodsController < ApplicationController
  
  before_filter :login_required
  before_filter :sidebar, :current_period, :except => [:create, :current]
  

  def show
    @last_period = Period.find(:first, :order => 'id DESC').finish + 1.day
    @new_period = Period.new
  end
    
  def create
    @period = Period.new(params[:new_period])
    if @period.save
      if import_previous_budget(@period.id) && create_new_debt(@period.id)
        flash[:notice] = "Successfully created period."
        redirect_to :back
      end
    end
  end
  
  def current
    period = Period.find(current_period)
    redirect_to period_path(period)
  end
  
  private
  
  def create_new_debt(new_period)
    debt = Debt.new
    debt.period_id = new_period
    debt.save
    return true
  end
  
  def import_previous_budget(new_period)
    current_budget = Budget.find(:first, :order => 'id DESC')
    new_budget = Budget.new
    new_budget.period_id = new_period
    new_budget.save
    for transaction in current_budget.transactions
      new_transaction = Transaction.new
        new_transaction.name = transaction.name
        new_transaction.budget_id = new_budget.id
        new_transaction.period_id = new_period
        new_transaction.transaction_date = transaction.transaction_date + 1.month
        new_transaction.amount = transaction.amount
        new_transaction.account_id = transaction.account_id
        new_transaction.account_id = transaction.account_id
      new_transaction.save
    end
    return true
  end
  
  

end
