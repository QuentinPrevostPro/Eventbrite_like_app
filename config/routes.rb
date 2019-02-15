Rails.application.routes.draw do
  root 'events#index'  
  resources :events do
    resources :images
    resources :charges
    resources :attendances
  end
namespace :admin do
  resources :events
end
  devise_for :users
  resources :users, only: [:show]
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
