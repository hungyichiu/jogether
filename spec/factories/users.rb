FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    name { Faker::Name.name }
    gender { [0, 1].sample }
    mobile { Faker::PhoneNumber.phone_number }
    # avatar { Faker::Avatar.image( size: "100x100", format: "jpg") }
  end
end