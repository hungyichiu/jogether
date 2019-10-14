FactoryBot.define do
  factory :event do
    event_name { Faker::Lorem.sentence }
    event_type { ["food", "art", "entertainment", "learn", "sport"].sample }
    # apply_end { Faker::Time.forward(days: 23, period: :morning }
    fee { Faker::Number.within(range: 100..1000) }
    min_attend { Faker::Number.within(range: 1..10) }
    # event_start { Faker::Time.forward(days: 23, period: :morning)}
    # image { Faker::LoremFlickr.image }
    # event_status { 'posted' }
    location { Faker::Address.full_address }
    description { Faker::Lorem.paragraph }
  end
end