class EventMailer < ApplicationMailer

  def update_notice(event)
    @event = event
    # mail to: event.user.email, subject: "#{event.event_name}活動內容有更新喔!"
  end

  def reach_min_notice(event)
    @event = event
    mail to: event.users.first.email, subject: "#{event.event_name}已到達成團人數囉!"
  end

  def success_notice(event: , user: )
    @event = event
    mail to: user.email, subject: "#{event.event_name}確認出團!"
    # mail to: event.users.map(&:email), subject: "#{event.event_name}確認出團!"
    # 上列等同 users.map{|u| u.email}
    # mail to: ['anneju.824@gmail.com', 'johnson@5xruby.tw'], subject: "#{@event.event_name}確認成團!"
  end

  def fail_notice(event: , user: )
    @event = event
    mail to: user.email, subject: "#{event.event_name}未達成團人數!"
  end

  def cancel_notice(event: , user: )
    @event = event
    mail to: user.email, subject: "#{event.event_name}已取消，請留意您的行程"
  end
end
