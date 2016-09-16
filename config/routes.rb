Rails.application.routes.draw do
  resources :cohorts
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :students
  resources :entries
  root "entries#index"
  
  get '/login', to: "sessions#new", as: "login"
  get '/auth/:provider/callback', to: "sessions#create"
end
