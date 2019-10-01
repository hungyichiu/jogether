class Event < ApplicationRecord
  validates :event_name, :event_type, :apply_end, :max_attend, :event_start, :event_end, :location, presence: true

  validates :apply_end, :timeliness => {:on_or_after => lambda { Date.current }, :type => :date}
  validates_date :event_start, on_or_after: :apply_end
  validates_date :event_end, on_or_after: :event_start

  has_many :event_logs, dependent: :destroy
  has_many :users, through: :event_logs

  has_many :likes
  has_many :like_users, through: :likes, source: 'user'

  enum event_type: { "運動": 0, "美食": 1, "藝文": 2, "娛樂": 3, "學習": 4 }
  enum event_status: { before_post: 0, posted: 1, closed: 2, rejected: 3 }
  has_one_attached :image
end
