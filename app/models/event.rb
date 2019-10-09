class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :event_num_generator, use: :slugged

  acts_as_paranoid
  # scope :available, -> { where.not(event_status: 'cancelled').where.not(event_status: 'closed')}
  scope :available, -> { where( event_status: [1, 2])}

  validates :event_name, :event_type, :apply_end, :event_start, :location, presence: true

  validates :apply_end, :timeliness => {:on_or_after => lambda { Date.current }, :type => :date}
  validates_date :event_start, on_or_after: :apply_end

  has_many :event_logs, dependent: :destroy
  has_many :users, through: :event_logs
  has_many :comments

  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: 'user'

  has_many :applied_participants_logs, -> { includes(:event_logs).where(role: 'member')}, class_name: 'EventLog'
  has_many :applied_participants, through: :applied_participants_logs, source: :user

  enum event_type: { sport: 0, food: 1, art: 2, entertainment: 3, learn: 4 }
  enum event_status: { open: 1, reached_min: 2, success: 3, fail: 4,cancelled: 5 }
  has_one_attached :image

  # after_commit :check_open_time_up_job

  def owner
    # event_logs.where(role: 1).first.user
    event_logs.owner.first.user
    # users.first
  end

  def self.search(search) #self.はUser.を意味する
    if search
       where(['event_name || location LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
       all #全て表示させる
    end
  end

  # in the future,可以把 job 放在 model。但是這個專案很多 after_commit，先移到 controller比較單純
  # def check_open_time_up_job
  #   job = CheckOpenTimeUpJob.perform_at(apply_end, id)
  # end

  include AASM
  aasm(column: :event_status, enum: true)do 
    state :open, initial: true
    state :reached_min, :success, :fail, :cancelled

    event :to_reach_min do
      transitions from: :open, to: :reached_min do
        guard do
          applied_participants_logs.count == min_attend
        end
        after do
        # 寄e-mail問主揪要不要收團還是繼續開放
        EventMailer.reach_min_notice(self).deliver_later
      end
      end
    end

    event :to_success do
      transitions from: :reached_min, to: :success
      # 團主按 收團
      # 非同步作業 確認時間
      after do
        users.each do |u|
          EventMailer.success_notice(event: self, user: u).deliver_later
        end
        # EventMailer.success_notice(self).deliver_later
        # self 指會觸發 .to_close 的這個event
      end
    end

    event :to_fail do
      transitions from: :open, to: :fail
      # 非同步作業 確認時間
      after do
        # 寄信通知團主與團員
        users.each do |u|
          EventMailer.fail_notice(event: self, user: u).deliver_later
        end
      end
    end

    event :to_cancel do
      transitions from: [:open, :reached_min], to: :cancelled
      after do
        # 寄信通知團主與團員
        users.each do |u|
          EventMailer.cancel_notice(event: self, user: u).deliver_later
        end
      end
    end
  end

  private
  def event_num_generator
    if persisted?
      event_create_date = created_at.to_s[0..9].delete('-')
    else
      event_create_date = Time.now.to_s[0..9].delete('-')
    end

    random_num = [*'A'..'Z', *0..9].sample(8).join
    "#{event_create_date}-#{random_num}"
  end

end

