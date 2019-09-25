class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :participants, :integer, default: 1
  end
end
