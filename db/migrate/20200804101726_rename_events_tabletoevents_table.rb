class RenameEventsTabletoeventsTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :Events, :events2
  end
end
