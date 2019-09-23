class EventLog < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum role: { member: 0, owner: 1 }
end
