class Barcode < ActiveRecord::Base
  
  belongs_to :barcodeable, :polymorphic => true  
    
end
