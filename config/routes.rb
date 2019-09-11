Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  devise_for :users

  resources :events

  root 'events#index'
end
