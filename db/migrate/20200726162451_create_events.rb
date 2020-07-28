class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.integer :owner_id

      t.timestamps
    end
  end
end
