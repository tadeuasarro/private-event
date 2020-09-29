Rails.application.routes.draw do
  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'
  root to: 'users#new'

  resources :users, only: [:new, :create, :show]
  
  

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
