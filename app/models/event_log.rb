class EventLog < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum role: { member: 0, owner: 1 }
  enum status: [:pending, :approved, :rejected, :cancelled, :attended ]

  extend FriendlyId
  friendly_id :checkin_number_generator, use: :slugged

  private
  def checkin_number_generator
    if persisted?
      event_log_create_date = created_at.to_s[0..9].delete('-')
    else
      event_log_create_date = Time.now.to_s[0..9].delete('-')
    end

    random_num = [*'A'..'Z', *0..9].sample(8).join
    "#{event_log_create_date}-#{random_num}"
  end
end
