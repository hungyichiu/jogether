namespace :event_log do
  desc '產生10筆event_log資料'
  task :generate => :environment do 
    10.times do
      FactoryBot.create(:event_log)
    end
  end
end