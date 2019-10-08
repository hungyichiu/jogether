class AddSelfIntroToUser < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :self_intro, :text)
  end
end
