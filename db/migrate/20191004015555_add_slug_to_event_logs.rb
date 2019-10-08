class AddSlugToEventLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :event_logs, :slug, :string
    add_index :event_logs, :slug, unique: true
  end
end
