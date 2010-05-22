class AddNameToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :name, :string
  end

  def self.down
    remove_column :transactions, :name
  end
end
