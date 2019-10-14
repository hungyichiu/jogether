class AddEventEndDateTimeToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column(:events, :event_end, :datetime)
  end
end
