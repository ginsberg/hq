class AddDebtToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :debt, :boolean
  end

  def self.down
    remove_column :accounts, :debt
  end
end
