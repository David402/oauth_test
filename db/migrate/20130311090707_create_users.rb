class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username, null: false
      t.string :password, null: false
      t.string :email

      t.timestamps
    end

    add_index :users, [:username], unique: true
  end

  def down
    drop_table :users
  end
end
