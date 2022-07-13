Rails.application.routes.draw do
  # User
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"
  post "/signup", to: "users#create"

  # Sessions
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # Properties"
  resource :properties do
    get "/index", to: "properties#index"
    get "/owned", to: "properties#owned"
  end
end
