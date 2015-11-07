Rails.application.routes.draw do


  root 'sessions#new'
  get 'athlete_sessions/new'
  get 'athlete_login' => 'athlete_sessions#new'
  post 'athlete_login' => 'athlete_sessions#create'
  get 'athlete_logout' => 'athlete_sessions#destroy'

  resources :clubs do
      resources :teams do
        resources :spots
      end
  end

  resources :athletes

  resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'clubs#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

end
