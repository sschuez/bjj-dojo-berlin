Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  # scope '/admin' do
  #     get 'start_impersonate' => 'admin#start_impersonate', as: 'start_impersonate'
  #     get 'stop_impersonating' => 'admin#stop_impersonating', as: 'stop_impersonate'
  #   end

  devise_for :users 
  
  resources :users do
  
    # Pretender Gem
    post :impersonate, on: :member
    post :stop_impersonating, on: :collection
    
    resources :comments

    resources :promotions, only: [:new, :create]
  end
  
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
