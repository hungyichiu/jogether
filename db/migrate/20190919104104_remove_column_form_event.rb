class RemoveColumnFormEvent < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :uesr_id
  end
end
