class AddPayments < ActiveRecord::Migration
  def self.up
    create_table :payments, :force => true do |t|
      t.string :name
      t.decimal :amount, :precision => 8, :scale => 2
      t.integer :debt_id
      t.integer :account_id
      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
