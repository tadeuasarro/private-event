Rails.application.routes.draw do
  root to: 'users#new'

  resources :users, only: [:new, :create, :show]

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
