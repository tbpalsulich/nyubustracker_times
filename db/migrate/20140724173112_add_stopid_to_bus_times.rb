class AddStopidToBusTimes < ActiveRecord::Migration
  def change
    add_column :bus_times, :stop_id, :integer
  end
end
