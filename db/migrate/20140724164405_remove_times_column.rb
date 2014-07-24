class RemoveTimesColumn < ActiveRecord::Migration
  def change
    remove_column :stops, :times
  end
end
