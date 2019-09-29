namespace :user do
  desc '產生10筆使用者資料'
  task :generate => :environment do 
    10.times do
      FactoryBot.create(:user)
    end
  end
end