class AddTimesJsonToStops < ActiveRecord::Migration
  def change
    add_column :stops, :times_json, :text
  end
end
