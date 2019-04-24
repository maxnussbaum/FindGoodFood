Rails.application.routes.draw do
  get 'dashboard/index'

  get 'welcome/login', :as => :welcome_login

  get '/login', :to => 'sessions#new', :as => 'login'
  match 'auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  match 'auth/failure', :to => 'sessions#failure', :via => [:get, :post]
  #get 'sessions/destroy', :as => 'logout'
  get 'search' => 'homepage#search'
  get 'results/food' => 'search#food'
  get 'results/restaurant' => 'search#restaurant'
  
  get '/logout', :to => 'sessions#destroy', :as => :logout
  get '/cleanup/', :to => 'sessions#cleanup', :as => :cleanup
  
  resources :users
  
  # get '/home', :to => 'homepage#home', :as => :home
  # root 'welcome#login'
  root 'homepage#home', :as => :home
end
