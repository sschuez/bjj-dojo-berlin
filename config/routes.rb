Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users 
  
  resources :users do
  
    resources :comments

    resources :promotions, only: [:new, :create]

    # Pretender Gem
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection

  
  end 
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
