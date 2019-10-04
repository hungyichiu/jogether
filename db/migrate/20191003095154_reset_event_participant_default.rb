class ResetEventParticipantDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:events, :participants, 0)
  end
end
