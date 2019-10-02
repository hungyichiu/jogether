class EventPolicy
  attr_reader :user, :event

  def initialize(user, event)
    @user = user 
    @event = event
  end

  def edit?
    event_owner(event)
  end

  def destroy?
    event_owner(event)
  end

  def apply?
    !event_owner(event) && !event_member(event)
  end

  def cancel_apply?
    event_member(event)
  end

  private
  def event_owner(event)
    user && user.raised?(event)
  end

  def event_member(event)
    user && user.applied?(event)
  end

end
