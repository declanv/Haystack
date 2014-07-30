Rails.application.routes.draw do
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#create", :as => "log_in"
  get "sign_up" => "users#create", :as => "sign_up"
  resources :users
  resources :maps
  resources :sessions, only: [:create]
  match 'sessions', to: 'sessions#create', via: [:options]
end

#    Prefix Verb    URI Pattern               Controller#Action
#   log_out GET     /log_out(.:format)        sessions#destroy
#    log_in GET     /log_in(.:format)         sessions#create
#   sign_up GET     /sign_up(.:format)        users#create
#     users GET     /users(.:format)          users#index
#           POST    /users(.:format)          users#create
#  new_user GET     /users/new(.:format)      users#new
# edit_user GET     /users/:id/edit(.:format) users#edit
#      user GET     /users/:id(.:format)      users#show
#           PATCH   /users/:id(.:format)      users#update
#           PUT     /users/:id(.:format)      users#update
#           DELETE  /users/:id(.:format)      users#destroy
#      maps GET     /maps(.:format)           maps#index
#           POST    /maps(.:format)           maps#create
#   new_map GET     /maps/new(.:format)       maps#new
#  edit_map GET     /maps/:id/edit(.:format)  maps#edit
#       map GET     /maps/:id(.:format)       maps#show
#           PATCH   /maps/:id(.:format)       maps#update
#           PUT     /maps/:id(.:format)       maps#update
#           DELETE  /maps/:id(.:format)       maps#destroy
#  sessions POST    /sessions(.:format)       sessions#create
#           OPTIONS /sessions(.:format)       sessions#create

