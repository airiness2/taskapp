class CreateGroupings < ActiveRecord::Migration[5.2]
  def change
    create_table :groupings do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
    add_index :groupings, :user_id
    add_index :groupings, :group_id
  end
end
