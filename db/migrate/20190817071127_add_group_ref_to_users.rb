class AddGroupRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :group_id, :integer
    add_reference :users, :grouping, foreign_key: true
  end
end
