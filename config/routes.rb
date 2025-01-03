Rails.application.routes.draw do
 
  resources :products
  root "products#index"

  root "posts#index"
end
