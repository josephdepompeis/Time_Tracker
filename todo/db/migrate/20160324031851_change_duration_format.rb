class ChangeDurationFormat < ActiveRecord::Migration
  def change
    change_column :entries, :duration, :integer
  end
end
