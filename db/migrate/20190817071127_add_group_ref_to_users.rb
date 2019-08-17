class AddGroupRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :grouping, foreign_key: true
  end
end
