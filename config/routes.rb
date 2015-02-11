PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'

  resources :posts, except: [:destory] do
    resources :comments, only: [:create]
  end
  
  resources :categories
  resources :users, only: [:show, :new, :create]

end
