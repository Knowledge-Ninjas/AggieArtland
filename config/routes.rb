Rails.application.routes.draw do
  resources :users
  resources :art_pieces

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  post 'logout', to: 'sessions#destroy'
  get  'logout', to: 'sessions#destroy'

  get "password/reset", to: "password_resets#new"
  post 'password/reset', to: 'password_resets#forgot'
  get 'password/reset/edit', to: 'password_resets#edit', as: 'password_reset_edit'
  post 'password/reset/edit', to: 'password_resets#reset'
end
