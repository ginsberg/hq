# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  include TagsHelper
  
  def flash_helper
      f_names = [:notice, :warning, :message]
      fl = ''
      for name in f_names
        if flash[:notice]
          fl = fl + "<div class=\"alert\">#{flash[name]}</div>"
        end
      flash[name] = nil;
    end
    return fl
  end
  
  
  def quid(price)
    number_to_currency(price, :unit => "&pound;")
  end
  
 
  
end
