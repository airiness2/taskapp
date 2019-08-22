class CreateReads < ActiveRecord::Migration[5.2]
  def change
    create_table :reads do |t|
      t.integer :task_id
      t.integer :user_id
      t.boolean :flg, :null => false, :default => false

      t.timestamps
    end
  end
end
