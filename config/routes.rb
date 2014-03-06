# require 'sidekiq/web'


Hatip::Application.routes.draw do

  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "pages#index"
  resources :users do
    resources :posts, shallow: true
  end

  resources :tags, only: [] do
    get :autocomplete_tag_name, :on => :collection
  end

  resources :about, only: [:index]
  resources :posts, only: [:index]
  resources :tips, :only => [:create]

  match 'admin', to: 'admins#index', via: :get
  match 'admin/revoke', to: 'admins#revoke_verification', via: :get

  match '/create_verifications', :to => 'users#create_verification'
  match '/revoke_verifications', :to => 'users#revoke_verification'

  match '/explore', :to => 'pages#explore'

  match 'show_music', :to => 'pages#show_music'
  match 'show_dance', :to => 'pages#show_dance'
  match 'show_acrobatic', :to => 'pages#show_acrobatic'
  match 'show_other', :to => 'pages#show_other'


  post "callback", :to => 'tips#create'
  post "callback/stripe/:id", :to =>'tips#create_stripe_tip'

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :api do
    resources :users
    resources :posts
  end

end
