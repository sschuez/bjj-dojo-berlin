Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/create'
  get 'comments/show'
  get 'comments/destroy'
  get 'comments/update'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  
  resources :users, only: [:index, :show, :edit] do
  	resources :comments
  
  end 
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
