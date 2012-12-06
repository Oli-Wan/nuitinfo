Nuitinfo::Application.routes.draw do

  devise_for :users

  root to: 'home#index'

  namespace :api do
    match '/auth' => 'authentication#authenticate', via: :post
  end
end
