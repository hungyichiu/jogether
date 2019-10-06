#encoding: utf-8 
namespace :event do
  desc '產生10筆活動資料'
  task :generate => :environment do 
    10.times do
      FactoryBot.create(:event)
    end
  end
end