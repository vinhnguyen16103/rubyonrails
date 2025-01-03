Rails.application.routes.draw do
 
  resources :products

  root "posts#index"
end
