class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :business_id
      t.date :date
      t.money :sales
      t.money :expenses
      t.text :comments

      t.timestamps
    end
  end
end
