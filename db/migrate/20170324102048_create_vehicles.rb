class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.boolean :isCar
      t.string :brand
      t.string :model
      t.integer :price
      t.integer :seat
      t.string :about

      t.timestamps
    end
  end
end
