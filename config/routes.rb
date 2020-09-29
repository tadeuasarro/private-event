Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  root to: 'events#index'

  resources :users, only: [:new, :create, :show]
  resources :events, except: [:delete, :update, :edit]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
