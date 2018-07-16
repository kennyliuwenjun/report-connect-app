class CreateBusniesses < ActiveRecord::Migration[5.2]
  def change
    create_table :busniesses do |t|
      t.string :name

      t.timestamps
    end
  end
end
