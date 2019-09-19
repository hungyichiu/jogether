class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :integer
    add_column :users, :user_level, :integer
    add_column :users, :mobile, :string
  end
end
