class CheckOpenTimeUpJob
  include Sidekiq::Worker
  # queue_as :default

  def perform(params)
    # byebug
    event = Event.find(params["id"])
    
    if event.reached_min?
      event.to_success!
    else
      event.to_fail!
    end
  end
end
