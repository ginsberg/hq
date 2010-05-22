class ChangeTransactionsAmount < ActiveRecord::Migration
  def self.up
    change_column :transactions, :amount, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    change_column :transactions, :amount, :string
  end
end
