class AddEditedStartedToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :edit_started_at, :datetime
    add_column :attendances, :edit_finishted_at, :datetime
  end
end
