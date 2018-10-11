Rails.application.routes.draw do
  get 'game/home'
  get 'game/question', defaults: { format: :json }

  root to: 'pages#welcome'

  resources :transactions
  devise_for :users
  resources :categories

  get '/home', to: 'pages#home', as: :user_root
  get '/set_categories', to: 'pages#set_categories', as: :set_categories
  post '/set_categories', to: 'pages#select_categories'

  post '/get_access_token', to: 'link#get_access_token', as: :get_access_token

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
