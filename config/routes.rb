Rails.application.routes.draw do
  get 'owner/show'
  root 'home#index'
  get 'repositories/index'
  get 'repositories/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
