class DropTableFavorite < ActiveRecord::Migration[5.2]
  def down
    drop_table :favorites
  end
end
