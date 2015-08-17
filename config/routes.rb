Rails.application.routes.draw do
 

  get 'news/show'

 root "site#index"
# users routes homie
 get "/signup", to: "users#new"
 get "/profile", to: "users#show"
 resources :users, only: [:create]

 #sessions routes
 get "/login", to: "sessions#new"
 post "/logout", to: "sessions#destroy"
 resources :sessions, only: [:create]


end

#  Prefix Verb URI Pattern         Controller#Action
#     root GET  /                   site#index
#   signup GET  /signup(.:format)   user#news
#  profile GET  /profile(.:format)  users#show
#    users POST /users(.:format)    users#create
#    login GET  /login(.:format)    sessions#new
#   logout GET  /logout(.:format)   sessions#destroy
# sessions POST /sessions(.:format) sessions#create
