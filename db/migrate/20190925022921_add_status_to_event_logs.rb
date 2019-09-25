class AddStatusToEventLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :event_logs, :status, :integer, default: 0
  end
end
