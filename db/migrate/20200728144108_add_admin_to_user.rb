class AddAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :zin, :boolean, default: false
    add_column :users, :can_host, :boolean, default: false
  end
end
