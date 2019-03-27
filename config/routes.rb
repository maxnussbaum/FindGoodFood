Rails.application.routes.draw do
  get 'search' => 'homepage#search'
  get 'results/food' => 'search#food'
  get 'results/restaurant' => 'search#restaurant'
  root 'homepage#home'
end
