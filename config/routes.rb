Rails.application.routes.draw do
  # get 'events/index'
  # get 'events/new'
  # get 'events/show'
  
  get 'users/activity', to: 'users#index'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resource :user do
    get 'user/index', to: 'user#index'
    get 'user/like', to: 'user#like'
    get 'user/my_events', to: 'user#my_events'
  end

  resources :events do
    member do
      put :add_to_list
    end

    collection do
      get :list
    end
  end

  root 'events#index'
end
