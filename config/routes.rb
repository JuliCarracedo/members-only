Rails.application.routes.draw do
  root to: 'posts#index'

  resources :posts, only: [:new, :create, :index] 
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/404', to: 'errors#not_found'
end
