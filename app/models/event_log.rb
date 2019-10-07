class EventLog < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum role: { member: 0, owner: 1 }
  validates_uniqueness_of :user_id, scope: :event_id
  
  after_commit :check_meet_min, if: Proc.new { |e| e.event.applied_participants_logs.count == e.event.min_attend }
  # # 這裡的 e 是 event_log
  after_destroy :check_under_min

  private

  def check_meet_min
    event.reach_min! # if applied_participants_logs.count == min_attend 整理到上面的 after_commit
  end

  def check_under_min
    event.back_to_open!
  end

end
