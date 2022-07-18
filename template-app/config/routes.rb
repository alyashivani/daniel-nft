require'sidekiq/web' 
require 'sidekiq/cron/web'
Rails.application.routes.draw do
  resources :rooms, only: [:index, :create]
  mount Sidekiq::Web => '/sidekiq' 
  mount ActionCable.server => '/cable'
  get "/healthcheck", to: proc { [200, {}, ["Ok"]] }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) #rescue ActiveAdmin::DatabaseHitDuringLoad
  root to: redirect('/admin')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :bx_block_profile do
    resources :passwords, only: %i(update)
    resources :profiles do
      put 'update_profile_picture', on: :collection
      get 'user_profile', on: :collection
      put 'update_profile', on: :collection
      get 'verified_nfts', on: :collection
      get 'friend_profile', on: :collection
      get 'friend_nft', on: :collection
      post 'verify_otp_for_profile_creation', on: :collection
    end
  end    

  namespace :bx_block_forgot_password do
  	resource :otps, only: %i(create)
    resource :passwords, only: %i(create)
    resources :otp_confirmations, only: %i(create)
  end

  namespace :account_block do
    resources :accounts do
      post 'find_user_by_username', on: :collection
      get 'search', on: :collection
      get 'user_list', on: :collection
      get 'search_history', on: :collection
      put 'deactivate_account', on: :collection
      put 'update_account_status', on: :collection
      put 'notification_setting', on: :collection
      put 'two_factor_authentication', on: :collection
      get 'twillio', on: :collection
      put 'update_username', on: :collection
      put 'update_name', on: :collection
      post 'update_tutorial', on: :collection
      get 'get_tutorial', on: :collection
      # get 'verify_otp_for_signup', on: :collection
    end
  end

  namespace :bx_block_posts do
    resources :posts do
      collection do
        get 'search'
        get 'my_posts'
        get 'friend_posts'
        get 'hashtag_posts'
        get 'trending_posts'
      end
    end
  end

  namespace :bx_block_cfmetamask do
    resources :wallets
    resources :previously_owned_nfts, only: :index 
  end

  get "post/:id/comments", to: "bx_block_comments/comments#index" 
  get "comments/:id", to: "bx_block_comments/comments#view_replies"
  post "post/:id/like", to: "bx_block_posts/posts#like"
  post "post/:id/dislike", to: "bx_block_posts/posts#dislike"

  namespace :bx_block_conn do
    resources :connections, only: %i(create) do
      put 'accept_friend_request', on: :collection
      put 'unfollow', on: :collection
      put 'follow', on: :collection
      delete 'unfriend'
      get 'friend_lists', on: :collection
      get 'pending_request', on: :collection
      get 'requested', on: :collection
      get 'user_friends', on: :collection
      get 'search_friend', on: :collection
    end
  end

  namespace :bx_block_chat do 
    resources :tokens, only: %i(create)
  end

  namespace :bx_block_adminconsole do
    resources :contact_us, only: %i(create)
  end

  namespace :bx_block_help_centre do 
    resources :interactive_faqs, only: %i(index)
  end

  namespace :bx_block_notifications do 
    resources :notifications do
      get 'badge_count', on: :collection
      post 'read_notification', on: :collection
    end
  end

  namespace :bx_block_block_users do 
    resources :block_users do
      get 'destroy_all_user', on: :collection
    end
  end

  namespace :bx_block_contentflag do 
    resources :report_posts, only: :create
    resources :report_reasons, only: :index
  end

  namespace :bx_block_searchhistory do 
    resources :search_histories, only: :destroy
  end
end
