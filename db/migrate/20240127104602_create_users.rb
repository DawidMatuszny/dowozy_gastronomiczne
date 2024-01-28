class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :frist_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
