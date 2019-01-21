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

  resources :users do
    resources :accounts, only: %i[edit update]
  end

  resources :accounts

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'catalogs#index'

  # Catalog Link
  resources :catalogs do
    resources :orders, only: %i[new create]
    # collection do
    #   put :collection
    # end
  end

  # Thank you page
  get '/thank-you', to: 'static_pages#thank_you_page', as: :thank_you_page
end
