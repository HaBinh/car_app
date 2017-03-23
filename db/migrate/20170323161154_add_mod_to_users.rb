class AddModToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mod, :boolean, default: false
  end
end
