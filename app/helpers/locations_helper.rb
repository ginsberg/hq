module LocationsHelper
  
  def location_icon(category)
    if category == 1
      return '/images/site/icons/house_lg.png'
    end
    if category == 2
      return '/images/site/icons/bookcase_lg.png'
    end
    if category == 3
      return '/images/site/icons/boxfile_lg.png'
    end
    if category == 4
      return '/images/site/icons/folder_lg.png'
    end
  end
  
end
