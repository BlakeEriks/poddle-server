Rails.application.routes.draw do
  get 'podcasts/search', to: 'podcasts#search'
  resources :podcasts
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
