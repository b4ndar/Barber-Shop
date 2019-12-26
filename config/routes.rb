Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :appointments
      resources :barbers

      root to: "users#index"
    end
  # devise_for :user
    devise_for :users ,  controllers: {
      sessions: 'users/sessions'
      
    }

    
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :users
    resources :barbers
    resources :appointments
    root 'application#home'
    
end
