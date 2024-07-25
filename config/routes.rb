Rails.application.routes.draw do
  get "search", to: "search#index"
  get "users/profile"
  devise_for :controllers
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/u/:id', to: "users#profile", as: 'user'
  resources :posts do
    resources :comments
  end
  get "about", to: "pages#about"
  root "pages#home"
end
