class AddMonthApprovalToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :month_approval, :integer
  end
end
