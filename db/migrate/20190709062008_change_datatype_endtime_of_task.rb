class ChangeDatatypeEndtimeOfTask < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :endtime, :date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
