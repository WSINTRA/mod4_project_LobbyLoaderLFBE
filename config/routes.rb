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
  resources :partymembers, only: [:create, :update]
  patch '/addUser', to: 'partymembers#create'
  patch '/removeUser', to: 'partymembers#leaveParty'
  resources :parties, only: [:create, :index, :update]

  resources :gamegenres
  resources :playerinterests
  resources :ownedgames
  resources :genres
  resources :games, only: [:index,]
  resources :users, only: [:create, :update]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      patch '/update', to: 'users#update'
      patch '/addGame', to: 'users#addGame'
      patch '/removeGame', to: 'users#removeGame'
end
