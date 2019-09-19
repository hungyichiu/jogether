class Event < ApplicationRecord
  has_many :users
  enum event_type: { "運動": 0, "吃飯": 1, "喝飲料": 2, "看電影": 3, "唱歌": 4 }
  enum event_status: { pending: 0, posted: 1, closed: 2, rejected: 3 }
end
