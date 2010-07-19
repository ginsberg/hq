class LocationShortDescription < ActiveRecord::Migration
  def self.up
    add_column :locations, :short_description, :string
  end

  def self.down
    remove_column :locations, :short_description
  end
end
