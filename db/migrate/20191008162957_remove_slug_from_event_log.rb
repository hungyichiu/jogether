class RemoveSlugFromEventLog < ActiveRecord::Migration[5.2]
  def change
    remove_column :event_logs, :slug
  end
end
