Rails.application.routes.draw do

  root 'sessions#new'

  resources :clubs do
      resources :teams
  end

  resources :athletes

  resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'clubs#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

end
