class MyController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def like
    @events = current_user.like_events.order(created_at: :desc)
    # HardWorkJob.perform_later(current_user.id)
  end

  def events_applied
    @events = current_user.applied_events.order(updated_at: :desc)
  end

  def events_raised
    @events = current_user.raised_events.order(updated_at: :desc)
  end

  
end
