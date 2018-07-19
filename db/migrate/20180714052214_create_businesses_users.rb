class CreateBusinessesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses_users do |t|
      t.integer :user_id
      t.integer :business_id
    end
  end
end
