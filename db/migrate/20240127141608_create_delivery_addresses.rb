class CreateDeliveryAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :delivery_addresses do |t|
      t.integer :user_id
      t.string :address

      t.timestamps
    end

    add_foreign_key :delivery_addresses, :users, column: :user_id
  end
end
