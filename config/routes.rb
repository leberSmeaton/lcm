Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about", as: "about"
end
