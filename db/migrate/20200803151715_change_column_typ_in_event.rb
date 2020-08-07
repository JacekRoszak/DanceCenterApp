class ChangeColumnTypInEvent < ActiveRecord::Migration[6.0]
  def change
    change_column :Events, :start_date, :date
    change_column :Events, :end_date, :date
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
