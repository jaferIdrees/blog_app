Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/', to: 'users#index'
  get '/users/:id', to: 'users#show'
  get '/posts/new', to: 'posts#new', as: 'new_post'
  get '/users/:user_id/posts', to: 'posts#index'
  get '/users/:user_id/posts/:id', to: 'posts#show'
  post '/users/1/posts', to: 'posts#create'
end
