Rails.application.routes.draw do

  get 'tryouts/new'

  get 'tryouts/create'

  get 'tryouts/edit'

  get 'tryouts/update'

  get 'tryouts/show'

  get 'tryouts/destroy'

  root 'welcome#index'
  get 'athlete_sessions/new'
  get 'athlete_login' => 'athlete_sessions#new'
  post 'athlete_login' => 'athlete_sessions#create'
  get 'athlete_logout' => 'athlete_sessions#destroy'
  get 'accept_invite' => 'athletes#accept_invite', as: 'accept_invite'
  get 'decline_invite' => 'athletes#decline_invite', as: 'decline_invite'

  get 'sites/search'
  post 'sites/search'



  resources :clubs do
    resources :seasons do
        resources :tryouts
        resources :teams do
          resources :spots
        end
      end
  end


  resources :athletes

  resources :sessions, only: [:new, :create, :destroy]
    get 'signup', to: 'clubs#new', as: 'signup'
    get 'login', to: 'sessions#new', as: 'login'
    get 'logout', to: 'sessions#destroy', as: 'logout'

end
