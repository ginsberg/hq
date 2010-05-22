class AddDebitToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :debit, :boolean
  end

  def self.down
    remove_column :categories, :debit
  end
end
