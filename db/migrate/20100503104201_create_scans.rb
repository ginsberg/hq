class CreateScans < ActiveRecord::Migration
  def self.up
    create_table :scans do |t|
      t.string :main_path
      t.string :thumb_path
      t.integer :asset_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :scans
  end
end
