class EventLog < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum role: { member: 0, owner: 1 }
  enum status: [:pending, :approved, :rejected, :cancelled, :attended ]
  # after_commit :check_meet_min, if: Proc.new { |e| e.event.applied_participants_logs.count == e.event.min_attend }
  # after_commit :check_meet_max, if: Proc.new { |e| e.event.applied_participants_logs.count == e.event.max_attend }
  # # 這裡的 e 是 event_log
  after_commit :check_meet_min_or_max
  after_destroy :check_under_min

  private
  def check_meet_min_or_max
    if applied_participants_logs.count == max_attend
      event.close!
    else applied_participants_logs.count == min_attend
      event.reach_min!
    end
  end

  # def check_meet_min
  #   event.reach_min! # if applied_participants_logs.count == min_attend 整理到上面的 after_commit
  # end

  def check_under_min
    if applied_participants_logs.count < max_attend && applied_participants_logs.count >= min_attend
      event.reach_min!
    else applied_participants_logs.count < min_attend
      event.back_to_open!
    end
  end

  # def check_meet_max
  #   event.close!
  # end
end
