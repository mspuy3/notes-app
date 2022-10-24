Rails.application.routes.draw do
  devise_for :users
  
  root "notes#index"

  resources :notes
  get 'notes/new', to: 'notes#new'
  get '/timed', to: 'notes#timed'

  resources :labels

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
