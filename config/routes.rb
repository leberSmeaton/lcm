Rails.application.routes.draw do
  resources :products
  devise_for :users
  root to: "pages#home"
  get "/about", to: "pages#about", as: "about"
  get "/transactionslist", to: "transactions#transactionslist", as: "transactionslist"
  get "/success", to: "transactions#success", as: "transaction_success"
  post "/transactions/webhook", to: "transactions#webhook", as: "webhook"
  # post "/transactions", to: "transactions#create_transaction_intent", as: "create_transaction"
end
