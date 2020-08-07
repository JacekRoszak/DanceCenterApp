class RenameEvents2ToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_table :events2, :events
  end
end
