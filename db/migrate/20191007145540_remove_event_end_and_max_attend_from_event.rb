class RemoveEventEndAndMaxAttendFromEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :max_attend
    remove_column :events, :event_end
  end
end
