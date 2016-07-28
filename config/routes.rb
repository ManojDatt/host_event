Rails.application.routes.draw do
 
  post 'comments/new'
  post 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  get 'comments/show'
  get 'publish_event'=>'events#publish_event', as:'publish_event'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'events#index'
  post'update_event/:id'=>'events#update_event', as:'update_event'
  post 'destroy_event/:id'=>'events#destroy_event', as:'destroy_event'
  resources :events 
  resources :friendships
  get 'like_event/:event_id' => 'events#like_event' , as:'like_event'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # devise_scope :user do
  # root to: "devise/sessions#new"
  # end
  get 'guest_friend_request/:friend_id' => 'friendships#guest_friend_request', as:'guest_friend_request'
  get 'accept_friend_request/:friend_id' => 'friendships#accept_friend_request' , as:'accept_friend_request'
  get 'reject_friend_request/:friend_id' => 'friendships#reject_friend_request' , as:'reject_friend_request'
  #######################  event joining  #########################
  post 'request_join_event/:host_id' => 'events#request_join_event' , as:'request_join_event' 
  post 'accept_event_join_request/:event_id' => 'events#accept_event_join_request' ,as:'accept_event_join_request'
  post 'reject_event_join_request/:event_id' => 'events#reject_event_join_request' ,as:'reject_event_join_request'
 

 
    post '/get_events' =>'events#get_events'  
    post '/get_guests' => 'events#get_guests' 

  # Serve websocket cable requests in-process
   mount ActionCable.server => '/cable'
end
