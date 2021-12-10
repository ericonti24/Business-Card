Rails.application.routes.draw do

  get '/' => 'sessions#home'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'

  get '/business_card' => 'business_cards#show'
  get '/new_business_card' => 'business_cards#new'
  post '/business_cards' => 'business_cards#create'
  get '/business_cards' => 'business_cards#index'



  get '/auth/:provider/callback', to: 'sessions#omniauth'
  # get '/auth/google' => 'sessions#create'


  resources :business_cards
  resources :users, except: [:new]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
