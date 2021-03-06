Rails.application.routes.draw do

  root   'static_pages#home'
  get    '/about',         to: 'static_pages#about'
  get    '/terms',         to: 'static_pages#terms'
  get    '/privacypolicy', to: 'static_pages#privacypolicy'

  patch  '/rooms/:room_url_token/users/:user_url_token/enter', to: 'users#enter', as: 'enter_room_user'
  patch  '/rooms/:room_url_token/users/:user_url_token/leave', to: 'users#leave', as: 'leave_room_user'

  resources :rooms, param: :url_token, only: [:create,:new,:edit,:show,:update,:destroy] do
    get    '/login',  to: 'sessions#new'
    post   '/login',  to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users, param: :user_url_token, except: [:show]
  end

end

#          Prefix Verb   URI Pattern                                                  Controller#Action
#            root GET    /                                                            static_pages#home
#           about GET    /about(.:format)                                             static_pages#about
#           terms GET    /terms(.:format)                                             static_pages#terms
#   privacypolicy GET    /privacypolicy(.:format)                                     static_pages#privacypolicy
# enter_room_user PATCH  /rooms/:room_url_token/users/:user_url_token/enter(.:format) users#enter
# leave_room_user PATCH  /rooms/:room_url_token/users/:user_url_token/leave(.:format) users#leave
#      room_login GET    /rooms/:room_url_token/login(.:format)                       sessions#new
#                 POST   /rooms/:room_url_token/login(.:format)                       sessions#create
#     room_logout DELETE /rooms/:room_url_token/logout(.:format)                      sessions#destroy
#      room_users GET    /rooms/:room_url_token/users(.:format)                       users#index
#                 POST   /rooms/:room_url_token/users(.:format)                       users#create
#   new_room_user GET    /rooms/:room_url_token/users/new(.:format)                   users#new
#  edit_room_user GET    /rooms/:room_url_token/users/:user_url_token/edit(.:format)  users#edit
#       room_user PATCH  /rooms/:room_url_token/users/:user_url_token(.:format)       users#update
#                 PUT    /rooms/:room_url_token/users/:user_url_token(.:format)       users#update
#                 DELETE /rooms/:room_url_token/users/:user_url_token(.:format)       users#destroy
#           rooms POST   /rooms(.:format)                                             rooms#create
#        new_room GET    /rooms/new(.:format)                                         rooms#new
#       edit_room GET    /rooms/:url_token/edit(.:format)                             rooms#edit
#            room GET    /rooms/:url_token(.:format)                                  rooms#show
#                 PATCH  /rooms/:url_token(.:format)                                  rooms#update
#                 PUT    /rooms/:url_token(.:format)                                  rooms#update
#                 DELETE /rooms/:url_token(.:format)                                  rooms#destroy
