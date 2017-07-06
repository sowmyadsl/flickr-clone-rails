Rails.application.routes.draw do
  root to: 'users#index'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  # get '/images/:id', to: 'images#show', as: 'image'


  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :users do
    resources :images
  end

  resources :images do
    resources :comments
  end
end
