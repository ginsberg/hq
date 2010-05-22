class CreateOutgoings < ActiveRecord::Migration
  def self.up
    create_table :outgoings do |t|
      t.string :name
      t.integer :amount
      t.date :paydate
      t.integer :budget_id
      t.integer :account_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :outgoings
  end
end
