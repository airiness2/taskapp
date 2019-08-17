class AddGroupRefToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :grouping
  end
end
