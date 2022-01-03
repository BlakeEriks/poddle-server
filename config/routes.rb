Rails.application.routes.draw do

  get 'podcasts/search', to: 'podcasts#search'
  get 'podcasts/my_list', to: 'podcasts#myList'
  get 'podcasts/top', to: 'podcasts#indexTop'
  delete 'podcasts/my_list/:id', to: 'podcasts#remove'
  post 'podcasts/my_list', to: 'podcasts#add'
  resources :podcasts, only: [:index, :show, :destroy]

  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  get 'genres/my_list', to: 'genres#myGenres'
  put 'genres/my_list', to: 'genres#update'
  resources :genres, only: [:index]

end
