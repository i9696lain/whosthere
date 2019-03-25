Rails.application.routes.draw do

  root   'static_pages#home'
  resources :rooms, only: [:new,:show,:create,:edit,:update]

end
