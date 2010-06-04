class RemoveThumbPathFromScans < ActiveRecord::Migration
  def self.up
    remove_column :scans, :main_path
    remove_column :scans, :thumb_path
  end

  def self.down
    add_column :scans, :thumb_path, :string
    add_column :scans, :main_path, :string
  end
end
