class ChangeTransactionDateAndDueDate < ActiveRecord::Migration
  def self.up
    change_column :transactions, :transaction_date, :datetime
    rename_column :transactions, :due_date, :due_date_old
  end

  def self.down
    rename_column :transactions, :due_date_old, :due_date
    change_column :transactions, :transaction_date, :date
  end
end
