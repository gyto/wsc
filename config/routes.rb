Rails.application.routes.draw do

  # User Profile Setup
  devise_for :users,
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 confirmation: 'verification',
                 sign_up: 'register'
             },
             controller: {
                 registrations: 'registrations'
             }

  resources :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'catalogs#index'

  # Catalog Link
  resources :catalogs
end
