Rails.application.routes.draw do
  resources :cohorts
  resources :students
  resources :entries

  root "entries#index"
  
  get '/login', to: "sessions#new", as: "login"
  get '/auth/:provider/callback', to: "sessions#create"
end
