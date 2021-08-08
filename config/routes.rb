Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about", as: "about"
  get "/success", to: "transactions#success", as: "transaction_success"
  post '/transactions/webhook', to: "transactions#webhook", as: "webhook"
end
