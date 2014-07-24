class CreateBusTimes < ActiveRecord::Migration
  def change
    create_table :bus_times do |t|
      t.time :departure_time

      t.timestamps
    end
  end
end
