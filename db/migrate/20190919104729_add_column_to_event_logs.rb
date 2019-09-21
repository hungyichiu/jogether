class AddColumnToEventLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :event_logs, :role, :integer, default: 0
  end
end
