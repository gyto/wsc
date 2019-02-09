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
    resources :orders, only: %i[show edit update] do
      member do
        patch 'paid'
      end
    end
  end

  resources :orders

  namespace :api do
    namespace :v1 do
      resources :orders, only: [:show] do
        resources :accounts, only: [:show]
      end
    end
  end

  resources :accounts
  resources :contacts, only: %i[new create]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root 'catalogs#index'

  # Catalog Link
  resources :catalogs do
    resources :orders, only: %i[new create]
  end

  # Static pages
  get '/thank-you', to: 'static_pages#thank_you_page', as: :thank_you_page
  get '/about-us', to: 'static__pages#about_us_page', as: :about_us_page
  get '/contact-us', to: 'static__pages#contact_us_page', as: :contact_us_page
end
