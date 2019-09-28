FactoryBot.define do
  factory :user do
    email { Faker::Internet.email  }
    password { 'password' }
    name { Faker::Name.name }
    gender { [0, 1].sample }
    user_level {  }
    mobile { Faker::PhoneNumber.phone_number }
  end
end