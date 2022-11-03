Rails.application.routes.draw do


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root '/',to: "users#index"
  devise_for :user #, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  delete 'users/:user_id/posts/:id', to: 'posts#destroy'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
