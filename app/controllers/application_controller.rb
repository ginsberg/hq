# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
    
  def sidebar
   @periods = Period.find(:all)
   if params[:period_id]
     @period = Period.find(params[:period_id])
    else
      @period = Period.find(params[:id])
    end
  end
  
  def current_period
    today = Date.today
    period = Period.find(:first, :conditions => ['start <= ? and finish >= ?', today, today])
    @current_period = period.id
  end
   
end
