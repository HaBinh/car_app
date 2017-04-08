class AddStatusToRentals < ActiveRecord::Migration[5.0]
  def change
    add_column :rentals, :status, :integer
  end
end
