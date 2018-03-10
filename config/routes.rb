Rails.application.routes.draw do
  get 'home/home'
  post 'home/member', to: 'home#add_member'
  post 'home/team', to: 'home#add_team'
  get 'home/teams', to: 'home#teams'
  get 'home/teams/:teamId', to: 'home#team_details'
  post 'home/member/identify', to: 'home#identify'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#teams'
end
