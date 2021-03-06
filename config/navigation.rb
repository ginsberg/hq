

# Configures your navigation
SimpleNavigation::Configuration.run do |navigation|  
  # Specify a custom renderer if needed. 
  # The default renderer is SimpleNavigation::Renderer::List which renders HTML lists.
  # navigation.renderer = Your::Custom::Renderer
  
  # Specify the class that will be applied to active navigation items. Defaults to 'selected'
  # navigation.selected_class = 'your_selected_class'
    
  # Item keys are normally added to list items as id.
  # This setting turns that off
  # navigation.autogenerate_item_ids = false
  
  # You can override the default logic that is used to autogenerate the item ids.
  # To do this, define a Proc which takes the key of the current item as argument.
  # The example below would add a prefix to each key.
  # navigation.id_generator = Proc.new {|key| "my-prefix-#{key}"}

  # The auto highlight feature is turned on by default.
  # This turns it off globally (for the whole plugin)
  # navigation.auto_highlight = false

  # Define the primary navigation
  navigation.items do |primary| 
    primary.item :money, '<span>Money</span>', current_period_path do |money|
      money.item :debt, '<span>Locations</span>', current_period_path
      money.item :budget, '<span>New Location</span>', current_period_path
    end
    primary.item :assets, '<span>Assets</span>', assets_path do |assets|
      assets.item :location, '<span>Home</span>', assets_path
      assets.item :location, '<span>Locations</span>', locations_path
      assets.item :new_location, '<span>New Location</span>', new_location_path
    end
  end
  
  
  
  
end