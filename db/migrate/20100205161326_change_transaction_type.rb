class ChangeTransactionType < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :type, :category
  end

  def self.down
    rename_column :transactions, :category, :type
  end
end
