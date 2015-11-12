Rails.application.routes.draw do


  root 'welcome#index'

  get 'accept_invite' => 'athletes#accept_invite', as: 'accept_invite'
  get 'decline_invite' => 'athletes#decline_invite', as: 'decline_invite'

  get 'sites/search'
  post 'sites/search'

  get 'notifications/notify'
  post 'notifications/notify' => 'notifications#notify'


  resources :athletes

  resources :clubs do
    resources :seasons do
        resources :tryouts do
            get 'register' => 'tryouts#register', as: 'register'
          end
        resources :teams do
          resources :spots
        end
      end
  end


  get 'signup', to: 'clubs#new', as: 'signup'

  get 'login_club' => 'sessions#new_club'
  post 'sessions/login_club'
  get 'login_athlete' => 'sessions#new_athlete'
  post 'sessions/login_athlete'
  get 'logout' => 'sessions#destroy'


  resources :charges

end
