class CreateAuths < ActiveRecord::Migration
  def up
    create_table :auths do |t|
      t.integer :client_id, null: false
      t.integer :user_id, null: false
      t.string :access_token, null: false
      t.timestamp :expires_at, null: false
      t.string :type
      t.string :code
      t.text :scope

      t.timestamps
    end

    add_index :auths, [:access_token], unique: true
    add_index :auths, [:client_id, :user_id], unique: true
  end

  def down
    drop_table :auths
  end
end
