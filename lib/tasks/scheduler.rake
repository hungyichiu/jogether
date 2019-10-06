desc "Heroku scheduler add-on"
task :say_hi => :environment do
  3.times do
    puts "Hello World"
  end
end

# task :send_reminders => :environment do
#   User.send_reminders
# end