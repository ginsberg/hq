class Scan < ActiveRecord::Base
  
  belongs_to :asset
  has_attached_file :data, :url => "/system/:class/:location/:style/:id.:extension",
          :styles => {
          :thumb=> "75x75#",
          :thumb_wide=> "145x89#",
          :large_thumb=> "120x120#",
          :small  => "150x150>",
          :medium  => "475x475>",
          :large  => "800x800>" }
       
    
  
end
