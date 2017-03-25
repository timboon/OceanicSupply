Rails.application.routes.draw do
  
  devise_for :admins
  devise_for :users
  
  devise_scope :users do
  get 'login', to: 'users#show'
  end
  
  resources :users  do
    resources :uploads, :only => [:show] 
   end
  
  root to: 'pages#home'
  
  resources :uploads, :only => [:new, :create, :destroy] 

  resources :projects
  
 get 'admin_login', to: 'admins#login'
 get 'certs', to: 'pages#certs'
 get 'contact', to: 'pages#contact'


end
  