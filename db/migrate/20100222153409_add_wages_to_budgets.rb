class AddWagesToBudgets < ActiveRecord::Migration
  def self.up
    add_column :budgets, :wages, :integer, :default => 0
  end

  def self.down
    remove_column :budgets, :wages
  end
end
