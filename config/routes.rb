Rails.application.routes.draw do
  get 'users/activity', to: 'users#index'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  get 'my/index', to: 'my#index'
  get 'my/like', to: 'my#like'
  get 'my/events', to: 'my#events'

  resources :events do
    member do
      put :apply
      put :cancel
      put :add_like
      put :dislike
    end

    collection do
      get :list
      get :food
      get :art
      get :entertainment
      get :learn
      get :sport
    end
  end

  root 'events#index'
end
