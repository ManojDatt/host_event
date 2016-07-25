Rails.application.routes.draw do
 
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'events#index'

  resources :events
  resources :friendships
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # devise_scope :user do
  # root to: "devise/sessions#new"
  # end
  get 'guest_friend_request/:friend_id' => 'friendships#guest_friend_request', as:'guest_friend_request'
  get 'accept_friend_request/:friend_id' => 'friendships#accept_friend_request' , as:'accept_friend_request'
  get 'reject_friend_request/:friend_id' => 'friendships#reject_friend_request' , as:'reject_friend_request'
  # Serve websocket cable requests in-process
   mount ActionCable.server => '/cable'
end
