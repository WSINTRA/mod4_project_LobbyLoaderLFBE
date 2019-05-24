Rails.application.routes.draw do
  resources :websites
  resources :keywords
  resources :gamescreenshots
  resources :gamecovers
  resources :gamemodes
  resources :platforms
  resources :messages
  resources :partymembers
  resources :parties
  resources :gamegenres
  resources :playerinterests
  resources :ownedgames
  resources :genres
  resources :games
  resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
end
