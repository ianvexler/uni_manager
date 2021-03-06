Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "main#index"  

  # Sign up routes
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # Login routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  # Logout routes
  post "logout", to: "sessions#delete"

  # Modules routes
  get "mods", to: "mods#index"
  post "mods/create", to: "mods#create"
  post "mods/edit", to: "mods#edit"

  # Grades routes
  get "grades", to: "grades#view"
  post "grades", to: "grades#create"

  # Specific module routes
  get "modcod", to: "modcod#index"
  post "modcod", to: "modcod#edit"

  # Assignment routes
  get "assignments", to: "assignments#view"
end 