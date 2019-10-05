FactoryBot.define do
  factory :event do
    event_name { Faker::Lorem.sentence }
    event_type { ["美食", "藝文", "娛樂", "學習", "運動"].sample }
    apply_end { Date.today }
    fee { Faker::Number.within(range: 100..1000) }
    max_attend { Faker::Number.within(range: 11..50) }
    min_attend { Faker::Number.within(range: 1..10) }
    event_start { Date.today}
    event_end { Faker::Date.forward(days: 20)}
    # image { Faker::LoremFlickr.image }
    # event_status { 'posted' }
    location { Faker::Address.full_address }
    description { Faker::Lorem.paragraph }
  end
end