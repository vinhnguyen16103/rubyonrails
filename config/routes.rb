Rails.application.routes.draw do
  root "products#index"
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
    resource :unsubscribe, only: [ :show ]

  
  end
end
