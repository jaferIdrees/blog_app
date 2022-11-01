Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root '/',to: "users#index"
  resource :user # <= here
  get '/', to: 'users#index'
  get '/users/:id', to: 'users#show'
  
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id/new_comment', to: 'comments#new', as: 'new_comment'
  get '/users/:user_id/posts/:id', to: 'posts#show'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/1/posts', to: 'posts#create'
  post '/users/:user_id/posts/:id', to: 'comments#create'
  post '/users/:user_id/posts/:id/like', to: 'posts#like'
end
