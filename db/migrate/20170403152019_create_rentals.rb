class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.integer :user_id
      t.integer :vehicle_id
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :verified, default: false

      t.timestamps
    end
  end
end
