class CleanUpOne < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :starting_balance
    remove_column :categories, :outgoing
    add_column :transactions, :posted, :boolean, :default => false
  end

  def self.down
    remove_column :transactions, :posted
    add_column :categories, :outgoing, :integer
    add_column :accounts, :starting_balance, :decimal, :precision => 8, :scale => 2
  end
end
