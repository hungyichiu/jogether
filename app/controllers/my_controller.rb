class MyController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end

  def like
  end

  def events
  end
end
