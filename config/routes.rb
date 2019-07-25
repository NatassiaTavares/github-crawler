Rails.application.routes.draw do
  root 'home#index'
  
  resources :owners, :only => [:show]
  resources :repositories, :only => [:index, :show]
end