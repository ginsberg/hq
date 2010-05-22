class AddWagesToBudget < ActiveRecord::Migration
  def self.up
    add_column :budgets, :wage, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :budgets, :wage
  end
end
