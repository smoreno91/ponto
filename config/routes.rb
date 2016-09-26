Rails.application.routes.draw do
  root to: "application#home"
  
  get '/dashboard', to: 'application#dashboard', as: :dashboard
  get '/company_registration', to: 'application#company_registration', as: :company_registration
  get '/check', to: 'application#check', as: :check
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  
  resources :users, path: '/user'
  
  put '/user/:id/activate/',	to: 'users#activate', as: :activate_user
  put '/user/:id/deactivate/',	to: 'users#deactivate', as: :deactivate_user
  get '/admins',	to: 'users#admins', as: :admins
  
  resources :companies, path: '/company'
  resources :entries, path: '/entry'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
