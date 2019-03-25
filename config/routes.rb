Rails.application.routes.draw do
  get 'homepage/home' => 'home'
  root 'homepage#home'
end
