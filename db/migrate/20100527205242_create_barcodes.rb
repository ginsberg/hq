class CreateBarcodes < ActiveRecord::Migration
  def self.up
    create_table :barcodes do |t|
      t.integer :sku
      t.integer :barcodeable_id
      t.string :barcodeable_type

      t.timestamps
    end
  end

  def self.down
    drop_table :barcodes
  end
end
