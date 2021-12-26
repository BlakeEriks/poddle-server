Rails.application.routes.draw do
  get 'podcasts/search', to: 'podcasts#search'
  get 'podcasts/my_list', to: 'podcasts#myList'
  get 'podcasts/top', to: 'podcasts#indexTop'
  delete 'podcasts/my_list/:id', to: 'podcasts#remove'
  resources :podcasts, only: [:index, :show, :create, :destroy]
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
