Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  
  get 'users/activity', to: 'users#index'

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  resources :events do
    member do
      put :add_to_list
    end
  end

  root 'events#index'
end
