namespace :db do
  desc 'Add fake events'
  task :fake_event => :environment do 
    20.times do
      Event.create(
        # event_name: 
        # event_type:
        
     )
    end
  end
end