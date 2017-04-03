class AddRentaldateToVehicles < ActiveRecord::Migration[5.0]
  def change
    add_column :vehicles, :start_at, :datetime
  	add_column :vehicles, :end_at, :datetime
  end
end
