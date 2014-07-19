class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.string :stop_id
      t.text :times

      t.timestamps
    end
  end
end
