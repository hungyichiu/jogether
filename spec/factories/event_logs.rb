FactoryBot.define do
  factory :event_log do
    user_id { create(:user).id }
    event_id { create(:event).id }
  end
end