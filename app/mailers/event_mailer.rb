class EventMailer < ApplicationMailer
  def confirm_event_email
    @event = params[:event]
    mail to: @event.users.first.email, subject: "#{@event.event_name}確認出團!"
  end
end
