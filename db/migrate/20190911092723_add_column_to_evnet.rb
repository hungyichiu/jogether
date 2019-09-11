class AddColumnToEvnet < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :uesr, foreign_key: true
  end
end
