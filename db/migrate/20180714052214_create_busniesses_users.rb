class CreateBusniessesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :busniesses_users do |t|
      t.integer :user_id
      t.integer :busniess_id
    end
  end
end
