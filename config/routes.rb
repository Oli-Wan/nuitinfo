Nuitinfo::Application.routes.draw do

  devise_for :users

  root to: 'home#index'

  namespace :api do
    match '/auth' => 'authentication#authenticate', via: :post
    match '/auth_test' => 'authentication#test_token', via: :get
  end
end
