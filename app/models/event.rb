class Event < ApplicationRecord
  has_many :users
  enum event_type: { "運動": 0, "美食": 1, "藝文": 2, "娛樂": 3, "學習": 4 }
  # enum event_status: { pending: 0, posted: 1, closed: 2, rejected: 3 }
end
