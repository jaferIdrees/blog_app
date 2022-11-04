Rails.application.routes.draw do
  get 'current_user/index'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root '/',to: "users#index"
  #devise_for :user #, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  # modefy devise routes to accept json
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/current_user', to: 'current_user#index'
  root 'users#index'
  delete 'users/:user_id/posts/:id', to: 'posts#destroy'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:index,:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
