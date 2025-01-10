Rails.application.routes.draw do
  resource :session
  resource :registration, only: %i[create new]
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
    resource :unsubscribe, only: [ :show ]
    collection do
      get 'list'
    end
  end
  root "products#index"
end