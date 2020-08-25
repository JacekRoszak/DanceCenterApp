class AddConfirmToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :confirmed, :boolean
    add_column :events, :start_time, :time
    add_column :events, :end_time, :time

  end
end
