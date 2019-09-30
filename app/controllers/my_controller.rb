class MyController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def like
    @events = current_user.like_events
  end

  def events_applied
    @events = current_user.events #要再改
  end

  def events_raised
    @events = current_user.events #要再改
  end

  
end
