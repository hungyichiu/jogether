class RemoveStatusFromEventLog < ActiveRecord::Migration[5.2]
  def change
    remove_column(:event_logs, :status)
  end
end
