class HardWorkJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
  end

  # def self.go(user_id)
  #   user = User.find(user_id)
  # end

  # def self.perform_later()
  #   self.new.perform
  # end
end
