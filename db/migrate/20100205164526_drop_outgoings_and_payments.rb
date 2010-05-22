class DropOutgoingsAndPayments < ActiveRecord::Migration
  def self.up
    drop_table :payments
    drop_table :outgoings
  end

  def self.down
    create_table "outgoings", :force => true do |t|
      t.string   "name"
      t.integer  "amount"
      t.date     "due_date"
      t.integer  "budget_id"
      t.integer  "account_id"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.date     "paid_date"
      t.integer  "debt_id"
    end
    
    create_table "payments", :force => true do |t|
      t.string   "name"
      t.decimal  "amount",     :precision => 8, :scale => 2
      t.integer  "debt_id"
      t.integer  "account_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    
  end
end
