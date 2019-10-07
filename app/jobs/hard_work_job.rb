class HardWorkJob < ApplicationJob

  def perform(user_id)
    user = User.find(user_id)
  end
end
