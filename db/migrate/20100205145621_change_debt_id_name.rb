class ChangeDebtIdName < ActiveRecord::Migration
  def self.up
    rename_column :outgoings, :debit_id, :debt_id
  end

  def self.down
    rename_column :outgoings, :debt_id, :debit_id
  end
end
