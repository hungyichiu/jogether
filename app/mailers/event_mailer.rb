class EventMailer < ApplicationMailer
  def confirm_event_email(event)
    # mail to: @event.users.map(&:email), subject: "#{@event.event_name}確認出團!"
    # 上列等同 user.map{|u| u.email}
    mail to: 'test@cc.cc', subject: "確認出團!"
  end
end
