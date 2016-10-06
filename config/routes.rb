Rails.application.routes.draw do
  resources :cohorts
  resources :students
  resources :entries
  resources :users


  root "entries#index"
  get '/search', to: "entries#search", as: "search"
  get '/login', to: "sessions#new", as: "login"
  get '/logout', to: "sessions#destroy", as: "logout"
  get '/auth/:provider/callback', to: "sessions#create"
end
