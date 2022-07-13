Rails.application.routes.draw do
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"

  post "/login", to: "sessions#create"
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy"
end
