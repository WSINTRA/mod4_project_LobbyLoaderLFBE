Rails.application.routes.draw do
  resources :coverimages
  resources :screenshots
  resources :gamekeywords
  resources :releases
  resources :gamemodes
  resources :modes
  resources :websites
  resources :keywords
  resources :platforms
  resources :messages
  resources :partymembers
  resources :parties
  resources :gamegenres
  resources :playerinterests
  resources :ownedgames
  resources :genres
  resources :games
  resources :users, only: [:create, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      patch '/update', to: 'users#update'
end
