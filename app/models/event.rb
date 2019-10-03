class Event < ApplicationRecord
  validates :event_name, :event_type, :apply_end, :max_attend, :event_start, :event_end, :location, presence: true

  validates :apply_end, :timeliness => {:on_or_after => lambda { Date.current }, :type => :date}
  validates_date :event_start, on_or_after: :apply_end
  validates_date :event_end, on_or_after: :event_start

  has_many :event_logs, dependent: :destroy
  has_many :users, through: :event_logs

  has_many :likes
  has_many :like_users, through: :likes, source: 'user'

  has_many :applied_participants_logs, -> { where(role: 'member')}, class_name: 'EventLog'
  has_many :applied_participants, through: :applied_participants_logs, source: :user

  enum event_type: { "運動": 0, "美食": 1, "藝文": 2, "娛樂": 3, "學習": 4 }
  enum event_status: { "草稿": 0, posted: 1, meet_min: 2, closed: 3, rejected: 4 }
  has_one_attached :image

  def self.search(search) #self.はUser.を意味する
     if search
       where(['event_name || location LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
     else
       all #全て表示させる
    end
 end
end
