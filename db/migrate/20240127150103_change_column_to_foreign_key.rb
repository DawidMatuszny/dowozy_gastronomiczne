class ChangeColumnToForeignKey < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :order_items, :products, column: :product_id
  end
end
