class ChangeColumnTypInEvent < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :start_date, :date
    change_column :events, :end_date, :date
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
