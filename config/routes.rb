Rails.application.routes.draw do
  resources :roles
  resources :actors
  resources :movies

  root 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
