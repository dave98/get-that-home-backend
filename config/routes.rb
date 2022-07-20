Rails.application.routes.draw do
  # User
  get "/profile", to: "users#show"
  patch "/profile", to: "users#update"
  post "/signup", to: "users#create"
  post "/attach", to:"users#attach_image"

  # Sessions
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :likes, only: [:index, :create, :destroy]
  resources :contacts, only: [:index, :create, :destroy]
  # Properties"
  resource :properties do
    get "/index", to: "properties#index"
    get "/owned", to: "properties#owned"
    get "/:id", to: "properties#show"
    patch "/:id", to: "properties#update"
    delete "/:id", to: "properties#destroy"
    post "/:id/attach", to: "properties#attach_images"
  end
end
