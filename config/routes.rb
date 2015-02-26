Rails.application.routes.draw do
  root 'games#new'

  resources :games
  resources :characters
end
