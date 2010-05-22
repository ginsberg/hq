class AddPaidDateToOutgoings < ActiveRecord::Migration
  def self.up
    add_column :outgoings, :paid_date, :date
  end

  def self.down
    remove_column :outgoings, :paid_date
  end
end
