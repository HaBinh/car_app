class AddNumOfRentalsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :num_of_rentals, :integer, default: 0
  end
end
