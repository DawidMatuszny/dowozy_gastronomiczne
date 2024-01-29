class AddIndexRestaurantstaff < ActiveRecord::Migration[7.1]
  def change
    add_index :restaurant_staffs, :username, unique: true
  end
end
