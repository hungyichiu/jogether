Rails.application.routes.draw do
  get 'users/activity', to: 'users#index'

  devise_for :users, controllers: { 
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: 'users/registrations' 

  }
  
  get 'my/index', to: 'my#index'
  get 'my/like', to: 'my#like'
  get 'my/events', to: 'my#events'

  resources :events do
    member do
      put :apply
      put :cancel
    end

    collection do
      get :list
    end
  end

  root 'events#index'
end
