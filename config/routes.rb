Rails.application.routes.draw do
  devise_for :accounts, path: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users do
  	resources :games
  end
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
    end
  end
end
