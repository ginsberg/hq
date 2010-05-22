class AddStartingBalanceToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :starting_balance, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :accounts, :starting_balance
  end
end
