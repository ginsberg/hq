class AddDebtIdToOustgoings < ActiveRecord::Migration
  def self.up
    add_column :outgoings, :debit_id, :integer
    rename_column :outgoings, :paydate, :due_date
  end

  def self.down
    rename_column :outgoings, :due_date, :paydate
    remove_column :outgoings, :debit_id
  end
end
