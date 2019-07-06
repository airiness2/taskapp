class AddColumnToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :endtime, :datetime, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
