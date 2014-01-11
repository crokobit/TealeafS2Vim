PostitTemplate::Application.routes.draw do
  root  'posts#index'
  resources :posts, except: [:destroy] do
       
    member do
      post 'vote'
    end

    resources :comments, only: [:create] do
  
      member do
        post 'vote'
      end

    end
    #member -> for every post
    #collection -> for single posts route 
 
  end
  resources :users, only: [:edit, :create, :update, :show]
  resources :categories, only:[:new, :create, :show]

  get '/regisiter',to: 'users#new'

  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  get '/logout',to: 'sessions#destroy'
end
