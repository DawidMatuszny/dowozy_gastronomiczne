class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.datetime :order_date
      t.integer :status

      t.timestamps
    end

    add_foreign_key :orders, :users, column: :user_id
  end
end
