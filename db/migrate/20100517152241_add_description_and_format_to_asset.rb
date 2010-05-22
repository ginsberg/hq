class AddDescriptionAndFormatToAsset < ActiveRecord::Migration
  def self.up
    add_column :assets, :description, :text
    add_column :assets, :format, :integer
  end

  def self.down
    remove_column :assets, :format
    remove_column :assets, :description
  end
end
