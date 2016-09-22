Rails.application.routes.draw do
  root to: "application#home"
  
  get '/dashboard', to: 'application#dashboard', as: :dashboard
  get '/company_registration', to: 'application#company_registration', as: :company_registration
  get '/check', to: 'application#check', as: :check
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  
  resources :users
  get '/admins',	to: 'users#admins', as: :admins
  put '/users/:id/activate/',	to: 'users#activate', as: :activate_user
  put '/users/:id/deactivate/',	to: 'users#deactivate', as: :deactivate_user
  
  resources :entries
  resources :companies
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
