class AddColumn < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurant_staffs, :username, :string
  end
end
