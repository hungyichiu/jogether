Rails.application.routes.draw do
  get 'users/activity', to: 'users#index'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  
  get 'my/index', to: 'my#index'
  get 'my/like', to: 'my#like'
  get 'my/events', to: 'my#events'
  get 'my/events-applied', to: 'my#events_applied'
  get 'my/events-raised', to: 'my#events_raised'

  resources :events do
    member do
      put :apply
      put :cancel_apply
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
      get :latest
      get :hot
      get :closing
    end
  end

  root 'events#index'
end
