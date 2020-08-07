class AddAdressToevent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :adress, :string
    add_column :events, :limit, :integer
    add_column :events, :schedule, :text
  end
end
