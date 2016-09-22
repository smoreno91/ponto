Rails.application.routes.draw do
  root to: "application#home"
  
  get '/dashboard', to: 'application#dashboard', as: :dashboard
  get '/company_registration', to: 'application#company_registration', as: :company_registration
  get '/check', to: 'application#check', as: :check
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  
  resources :entries
  resources :companies
  
  resources :employees
  put '/employees/:id/activate/',	to: 'employees#activate', as: :activate_employee
  put '/employees/:id/deactivate/',	to: 'employees#deactivate', as: :deactivate_employee
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
