class RenameStopTimesJsonColumn < ActiveRecord::Migration
  def change
    rename_column :stops, :times_json, :times
  end
end
