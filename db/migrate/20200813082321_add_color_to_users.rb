class AddColorToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :post_color, :string
  end
end
