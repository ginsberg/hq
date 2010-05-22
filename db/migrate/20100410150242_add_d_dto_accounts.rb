class AddDDtoAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :direct_debit, :boolean
  end

  def self.down
    remove_column :accounts, :direct_debit
  end
end
