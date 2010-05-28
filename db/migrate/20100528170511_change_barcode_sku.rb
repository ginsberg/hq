class ChangeBarcodeSku < ActiveRecord::Migration
  def self.up
    change_column :barcodes, :sku, :integer, :limit => 8, :nil => false, :force => true
    add_index :barcodes, :sku, :unique => true
  end

  def self.down
    remove_index :barcodes, :sku
    change_column :barcodes, :sku, :integer
  end
end
