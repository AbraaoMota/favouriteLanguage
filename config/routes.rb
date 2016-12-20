Rails.application.routes.draw do
  resources :github_users
  get "/" => "index#index", as: "index"
end
