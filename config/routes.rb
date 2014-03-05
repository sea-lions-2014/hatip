Hatip::Application.routes.draw do

  # devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "pages#index"
  resources :users do
    resources :posts
  end

  resources :posts, only: [:index]
  resources :tips, :only => [:create]

  match 'admin', to: 'admins#index', via: :get
  match 'admin/revoke', to: 'admins#revoke_verification', via: :get

  match '/create_verifications', :to => 'users#create_verification'
  match '/revoke_verifications', :to => 'users#revoke_verification'



  post "callback", :to => 'tips#create'
  get "callback", :to => 'tips#index'

  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  namespace :api do
    resources :users
    resources :posts
  end

end
