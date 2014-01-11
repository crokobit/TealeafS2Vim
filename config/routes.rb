PostitTemplate::Application.routes.draw do
  root  'posts#index'
  resources :posts, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:edit, :create, :update, :show]
  resources :categories, only:[:new, :create, :show]

  get '/regisiter',to: 'users#new'

  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  get '/logout',to: 'sessions#destroy'
end
