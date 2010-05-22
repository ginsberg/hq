class ChangeTransactionsCategory < ActiveRecord::Migration
  def self.up
    rename_column :transactions, :category, :category_id
  end

  def self.down
    rename_column :transactions, :category_id, :category
  end
end
