class Like < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates_uniqueness_of :user_id, scope: :event_id
  # 確認 user_id & event_id 相同時不可以重複
end
