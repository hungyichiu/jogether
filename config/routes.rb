Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  
  get 'users/activity', to: 'users#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :events do
    member do
      put :add_to_list
    end
  end

  root 'events#index'
end
