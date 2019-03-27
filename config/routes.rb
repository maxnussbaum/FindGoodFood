Rails.application.routes.draw do
  get 'homepage/home' => 'home'
  get 'homepage/search' => 'search'
  get 'search' => 'homepage#search'
  root 'homepage#home'
end
