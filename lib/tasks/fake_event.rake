namespace :db do
  desc 'Add fake events'
  task :fake_event => :environment do 
    20.times do
      Event.create(
        # event_name: ,
        # event_type: ,
        # location: Faker::Address.full_address,
        # apply_start: 
        # apply_end:
        
     )
    end
  end
end