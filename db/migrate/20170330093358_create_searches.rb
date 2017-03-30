class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.string :brand
      t.boolean :isCar
      t.integer :min_price
      t.integer :max_price
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
