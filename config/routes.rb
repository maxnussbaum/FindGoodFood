Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/failure'

  get 'sessions/destroy'

  get 'search' => 'homepage#search'
  get 'results/food' => 'search#food'
  get 'results/restaurant' => 'search#restaurant'
  root 'homepage#home'
end
