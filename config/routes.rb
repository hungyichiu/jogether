Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  devise_for :users 
  
  get 'users/activity', to: 'users#index'

  resources :events do
    member do
      put :add_to_list
    end
  end

  root 'events#index'
end
