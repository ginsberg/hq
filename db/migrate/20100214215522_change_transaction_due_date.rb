class ChangeTransactionDueDate < ActiveRecord::Migration
  def self.up
    change_column :transactions, :due_date, :datetime
  end

  def self.down
    change_column :transactions, :due_date, :string
  end
end
