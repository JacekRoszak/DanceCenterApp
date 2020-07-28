class AddConfirmToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :confirmed, :boolean
  end
end
