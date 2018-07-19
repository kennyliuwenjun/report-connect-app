class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.integer :user_id
      t.integer :business_id

      t.timestamps
    end

    add_index :admins, [:user_id, :business_id], unique: true
  end
end
