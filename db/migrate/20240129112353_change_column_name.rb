class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurant_staffs, :user_name, :username
  end
end
