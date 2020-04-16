class AddMonthCheckToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :month_check, :integer
  end
end
