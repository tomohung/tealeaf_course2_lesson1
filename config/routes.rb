PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :posts, except: [:destory] do
    resources :comments, only: [:create]
  end
  
  resources :categories
  resources :users, except: [:new]
  resources :votes, only: [:create, :destroy]
end
