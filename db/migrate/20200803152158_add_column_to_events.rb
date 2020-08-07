class AddColumnToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :Events, :start_time, :time
    add_column :Events, :end_time, :time
  end
end
