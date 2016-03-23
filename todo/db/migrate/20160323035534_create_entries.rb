class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :developer_id
      t.date :date
      t.integer :project_id
      t.time :duration

      t.timestamps null: false
    end
    add_index :entries, :developer_id
  end
end
