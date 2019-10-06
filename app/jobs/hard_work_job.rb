class HardWorkJob < ApplicationJob
  sidekiq_options retry: false
  # queue_as :default

  def perform(user_id)
    # user = User.find(user_id)
    10.times do
      puts "Hello World"
    end
    
  end
end
