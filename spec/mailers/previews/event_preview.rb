# Preview all emails at http://localhost:3000/rails/mailers/event
class EventPreview < ActionMailer::Preview
  def confirm_event_email
    event = FactoryBot.create(:event_log).event
    user = FactoryBot.create(:event_log).user
    EventMailer.with(event: @event, user: @user).confirm_event_email
  end
end
