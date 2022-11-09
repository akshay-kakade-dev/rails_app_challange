require "sidekiq/web"

Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: "_interslice_session"


Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope 'admin' do
    mount Sidekiq::Web => "sidekiq", :as => "sidekiq"
  end

  resources :users do
    member do
      resources :products, only: [:index, :create]
    end
  end

  resources :courses, only: [:create, :index]

  post '/users/products/upload', to: 'products#upload', as: 'product_bulk_upload'
end
