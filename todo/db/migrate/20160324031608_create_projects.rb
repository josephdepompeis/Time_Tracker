class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :max_time_spent
      t.string :description

      t.timestamps null: false
    end
  end
end
