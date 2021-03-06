# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  

  def current_period
    today = Date.today
      if period = Period.find(:first, :conditions => ['start <= ? and finish >= ?', today, today])
        @current_period = period.id
      else
        @curent_period = Period.find(:first)
      end
  end
   
end
