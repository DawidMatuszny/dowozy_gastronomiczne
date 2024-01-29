class AddPasswordDigestToStuff < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurant_staffs, :password
    add_column :restaurant_staffs, :password_digest, :string
    add_index :restaurant_staffs, :user_name, unique: true
  end
end
