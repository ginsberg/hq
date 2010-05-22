# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def quid(price)
    number_to_currency(price, :unit => "&pound;")
  end
  
 
  
end
