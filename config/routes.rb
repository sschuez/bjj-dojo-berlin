Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'comments/create'
  get 'comments/show'
  get 'comments/destroy'
  get 'comments/update'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users 
  
  resources :users do
  	resources :comments

    # get 'passwords/edit' => 'devise/passwords#edit', :as => 'edit_password'    
    # put 'passwords' => 'devise/passwords#update', :as => 'user_password'
  
  end 
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
