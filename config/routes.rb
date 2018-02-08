Rails.application.routes.draw do
  devise_for :accounts, path: '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users do
  	resources :games
  end
  resources :accounts
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
      devise_scope :account do
        post '/accounts/sign_in' => 'sessions#create'
        post '/accounts/sign_out' => 'sessions#destroy'
      end
    end

  end
end
