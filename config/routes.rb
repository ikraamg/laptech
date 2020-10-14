Rails.application.routes.draw do
  resources :favourites, only: [:create, :destroy]
  get "/user_favourites", to: "favourites#user_favourites"
  resources :teches
  # get "/teches/:id/favourited_count", to: "teches#favourited_count"
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
