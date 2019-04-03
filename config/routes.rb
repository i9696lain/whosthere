Rails.application.routes.draw do

  root   'static_pages#home'

  patch  '/rooms/:room_id/users/:user_id/enter', to: 'users#enter', as: 'enter_room_user'
  patch  '/rooms/:room_id/users/:user_id/leave', to: 'users#leave', as: 'leave_room_user'

  resources :rooms , only: [:create,:new,:edit,:show,:update,:destroy] do
    get    '/login',  to: 'sessions#new'
    post   '/login',  to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :users, param: :user_id, only: [:index,:create,:new,:edit,:update,:destroy,:enter,:leave]
  end

end

#         Prefix Verb   URI Pattern                                   Controller#Action
#           root GET    /                                             static_pages#home
#     room_login GET    /rooms/:room_id/login(.:format)               sessions#new
#                POST   /rooms/:room_id/login(.:format)               sessions#create
#    room_logout DELETE /rooms/:room_id/logout(.:format)              sessions#destroy
#     room_users GET    /rooms/:room_id/users(.:format)               users#index
#                POST   /rooms/:room_id/users(.:format)               users#create
#  new_room_user GET    /rooms/:room_id/users/new(.:format)           users#new
# edit_room_user GET    /rooms/:room_id/users/:user_id/edit(.:format) users#edit
#      room_user PATCH  /rooms/:room_id/users/:user_id(.:format)      users#update
#                PUT    /rooms/:room_id/users/:user_id(.:format)      users#update
#                DELETE /rooms/:room_id/users/:user_id(.:format)      users#destroy
#          rooms POST   /rooms(.:format)                              rooms#create
#       new_room GET    /rooms/new(.:format)                          rooms#new
#      edit_room GET    /rooms/:id/edit(.:format)                     rooms#edit
#           room GET    /rooms/:id(.:format)                          rooms#show
#                PATCH  /rooms/:id(.:format)                          rooms#update
#                PUT    /rooms/:id(.:format)                          rooms#update
#                DELETE /rooms/:id(.:format)                          rooms#destroy