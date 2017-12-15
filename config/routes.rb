Rails.application.routes.draw do
  devise_for :users
  resources :roles
  resources :actors
  resources :movies

  root 'movies#index'

  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
