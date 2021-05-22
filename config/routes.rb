Rails.application.routes.draw do

  resources :users, only: [:create, :update, :show]

  post '/auth/login', to: 'auth#login'

end
