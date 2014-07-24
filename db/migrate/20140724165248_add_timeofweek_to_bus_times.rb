class AddTimeofweekToBusTimes < ActiveRecord::Migration
  def change
    add_column :bus_times, :timeofweek, :string
  end
end
