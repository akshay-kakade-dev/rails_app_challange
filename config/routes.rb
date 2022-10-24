Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    member do
      resources :products, only: [:index, :create]
    end
  end

  post '/users/products/upload', to: 'products#upload', as: 'product_bulk_upload'
end
