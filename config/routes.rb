Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users, only: [:new, :create, :show]
  resources :invitations, only: [:new, :create]
  resources :events, except: [:delete, :update, :edit]

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
