Nuitinfo::Application.routes.draw do

  resources :media


  resources :items


  devise_for :users

  root to: 'home#index'

  namespace :api do
    match '/auth' => 'authentication#authenticate', via: :post
    match '/auth_test' => 'authentication#test_token', via: :get
  end
end
