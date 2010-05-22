class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions, :force => true do |t|
      t.integer :amount, :precision => 8, :scale => 2
      t.integer :type
      t.date :due_date
      t.datetime :payment_date
      t.integer :budget_id
      t.integer :account_id
      t.integer :debt_id
      t.integer :period_id
      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
