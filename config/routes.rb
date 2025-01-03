Rails.application.routes.draw do
  get "/products", to: "products#index"
  resources :products

  root "posts#index"
end
