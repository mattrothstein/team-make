Rails.application.routes.draw do

  root 'sessions#new'

  resources :clubs
  resources :teams
  resources :athletes

  resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'clubs#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

end
