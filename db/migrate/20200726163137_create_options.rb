class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.integer :number
      t.text :description
      t.integer :amount
      t.integer :event_id

      t.timestamps
    end
  end
end
