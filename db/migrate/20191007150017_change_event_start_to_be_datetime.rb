class ChangeEventStartToBeDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column(:events, :event_start, :datetime)
    change_column(:events, :apply_end, :datetime)
  end
end
