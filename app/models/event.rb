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
  enum event_status: { draft: 0, open: 1, reached_min: 2, apply_end: 3, cancelled: 4 }
  has_one_attached :image

  def self.search(search) #self.はUser.を意味する
    if search
       where(['event_name || location LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
       all #全て表示させる
    end
  end

  include AASM
  aasm(column: :event_status, enum: true, no_direct_assignment: true)do 
    state :open, initial: true
    state :reached_min, :apply_end, :cancelled

    event :reach_min do
      transitions from: :open, to: :reached_min, guard: :meet_min?
      after do
        puts "發送email"
      end
    end

    event :close do
      transitions from: [:open, :reached_min], to: :closed
      after do
        puts "發送email"
      end
    end

    event :cancel do
      transitions from: [:open, :reached_min, :apply_end], to: :cancelled
      after do
        puts "發送email"
      end
    end
  end

  def meet_min? 
    if applied_participants_logs.count == min_attend
      # reach_min!
    end
  end

end

