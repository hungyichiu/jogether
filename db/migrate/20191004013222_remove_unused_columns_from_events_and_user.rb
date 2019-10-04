class RemoveUnusedColumnsFromEventsAndUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :apply_start
    remove_column :events, :event_pic
    remove_column :users, :age
    remove_column :users, :user_level
  end
end
