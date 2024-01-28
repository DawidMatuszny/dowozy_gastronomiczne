class ChangeColumnNameInTableUsers < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :frist_name, :first_name
  end
end
