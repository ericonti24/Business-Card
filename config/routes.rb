Rails.application.routes.draw do

  get '/' => 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users' => 'users#index'

  get '/business_cards_new' => 'business_cards#new'
  post '/business_cards' => 'business_cards#create'
  get '/business_card' => 'business_cards#show'
  get '/business_cards' => 'business_cards#index'



  get '/auth/:provider/callback', to: 'sessions#omniauth'
  # get '/auth/google' => 'sessions#create'


  # resources :business_cards
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
