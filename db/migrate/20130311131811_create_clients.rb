class CreateClients < ActiveRecord::Migration
  def up
    create_table :clients do |t|
      t.string :app_id, null: false
      t.string :app_secret, null: false
      t.string :name, null: false
      t.text :redirect_uri

      t.timestamps
    end

    add_index :clients, [:app_id], unique: true
  end

  def down
    drop_table :clients
  end
end
