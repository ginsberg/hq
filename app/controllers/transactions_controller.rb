class TransactionsController < ApplicationController

  before_filter :login_required
  
  def create
    @transaction = Transaction.new(params[:transaction])
    if @transaction.category != nil
      if @transaction.category.debit == true
       @transaction.amount = (@transaction.amount - @transaction.amount - @transaction.amount)
     end
    end
    if @transaction.save
      flash[:notice] = "Successfully created debt."
      redirect_to :back
    else
      render :action => 'new'
    end
  end
  
  def post
    transaction = Transaction.find(params[:id])
    transaction.payment_date = Time.now
    transaction.save
    redirect_to :back
  end
  
  def unpost
     transaction = Transaction.find(params[:id])
     transaction.payment_date = nil
     transaction.save
     redirect_to :back
   end
  
  

end
