class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.integer :user_id
      t.integer :busniess_id

      t.timestamps
    end

    add_index :admins, [:user_id, :busniess_id], unique: true
  end
end
