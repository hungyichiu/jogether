class Event < ApplicationRecord
  validates :event_name, :event_type, presence: true
  has_many :event_logs, dependent: :destroy
  has_many :users, through: :event_logs
  enum event_type: { "運動": 0, "美食": 1, "藝文": 2, "娛樂": 3, "學習": 4 }
  enum event_status: { before_post: 0, posted: 1, closed: 2, rejected: 3 }
  has_one_attached :image
end
