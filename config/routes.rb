# Rails.application.routes.draw do
#   devise_for :users
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
#   root 'posts#index'
#   resources :posts, only: [:new, :create, :index]
# end


Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'posts#index'

  devise_for :users
  
  resources :users do
    resources :posts, only: [:new, :create, :index]
  end

  # resources :users do
  #   resources :posts
  # end

end


# Rails.application.routes.draw do
#   root "articles#index"

#   # get '/articles', to: 'articles#index'
#   # get '/articles/:id', to: 'articles#show'
#   resources :articles do
#     resources :comments
#   end

#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end

