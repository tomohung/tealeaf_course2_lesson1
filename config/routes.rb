PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  resources :posts, except: [:destory] do
    resources :comments, only: [:create]
  end
  
  resources :categories
  resources :users, only: [:show]
end
