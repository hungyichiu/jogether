class MyController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def like
    @events = current_user.like_events
  end

  def events
    @events = current_user.events
  end

  
end
