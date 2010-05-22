class ChangePeriodDates < ActiveRecord::Migration
  def self.up
    change_column :periods, :start, :datetime
    change_column :periods, :finish, :datetime
  end

  def self.down
    change_column :periods, :finish, :date
    change_column :periods, :start, :date
  end
end
