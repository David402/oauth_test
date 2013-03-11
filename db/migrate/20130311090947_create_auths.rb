class CreateAuths < ActiveRecord::Migration
  def change
    create_table :auths do |t|
      t.string :type
      t.string :access_token
      t.integer :user_id
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
