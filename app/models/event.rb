class Event < ApplicationRecord
  acts_as_paranoid
  scope :available, -> { where.not(event_status: 'cancelled').where.not(event_status: 'closed')}
  scope :available, -> { where( event_status: [ 0,1,2])}

  validates :event_name, :event_type, :apply_end, :max_attend, :event_start, :event_end, :location, presence: true

  validates :apply_end, :timeliness => {:on_or_after => lambda { Date.current }, :type => :date}
  validates_date :event_start, on_or_after: :apply_end
  validates_date :event_end, on_or_after: :event_start

  has_many :event_logs, dependent: :destroy
  has_many :users, through: :event_logs
  has_many :comments

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: 'user'

  has_many :applied_participants_logs, -> { where(role: 'member')}, class_name: 'EventLog'
  has_many :applied_participants, through: :applied_participants_logs, source: :user

  enum event_type: { sport: 0, food: 1, art: 2, entertainment: 3, learn: 4 }
  enum event_status: { draft: 0, open: 1, reached_min: 2, closed: 3, cancelled: 4, aaab: 5 }
  has_one_attached :image

  def self.search(search) #self.はUser.を意味する
    if search
       where(['event_name || location LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
       all #全て表示させる
    end
  end

  include AASM
  aasm(column: :event_status, enum: true)do 
    state :open, initial: true
    state :reached_min, :apply_end, :closed, :cancelled

    event :back_to_open do
      transitions from: [:reached_min, :open], to: :open
    end

    event :reach_min do
      transitions from: :open, to: :reached_min do
        guard do
          applied_participants_logs.count == min_attend
        end
      end
    end

    event :to_close do
      transitions from: [:open, :reached_min], to: :closed
      # 團主按 收團
      # 非同步作業 確認時間
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

end

