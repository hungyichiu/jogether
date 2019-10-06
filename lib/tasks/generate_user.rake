#encoding: utf-8 
namespace :user do
  desc '產生3筆使用者資料'
  task :generate => :environment do 
    3.times do
      FactoryBot.create(:user)
    end
  end
end