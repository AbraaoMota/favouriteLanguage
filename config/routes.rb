Rails.application.routes.draw do
  get "/" => "index#index", as: "index"

  resources :github_user
end
