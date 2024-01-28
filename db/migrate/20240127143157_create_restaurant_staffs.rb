class CreateRestaurantStaffs < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_staffs do |t|
      t.string :user_name
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :role

      t.timestamps
    end
  end
end
