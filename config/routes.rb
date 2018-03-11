Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'home/home'
  post 'home/member', to: 'home#add_member'
  post 'home/team', to: 'home#add_team'
  get 'home/teams', to: 'home#teams', as: 'teams'
  get 'home/teams/:teamId', to: 'home#team_details'
  post 'home/member/identify', to: 'home#identify'
  get 'home/show', to: 'home#show'
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'
end
