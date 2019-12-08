Rails.application.routes.draw do
  
  get 'informations/index'
  get 'informations/new'
  get 'reservations/index'
  get 'clinics/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  
  devise_for :users, controllers: { registrations: 'users/registrations' }, :skip => [:session]
  devise_scope :user do
    get "/", to: "devise/sessions#new", as: :new_user_session
    post "login", to: "devise/sessions#create", as: :user_session
    delete "logout", to: "devise/sessions#destroy", as: :destroy_user_session
    get "signup", to: "devise_invitable/registrations#new"
    post "signup", to: "devise_invitable/registrations#create"
    get "signup/cancel", to: "devise_invitable/registrations#cancel"
    get "user", to: "devise_invitable/registrations#edit"
    patch "user", to: "devise_invitable/registrations#update", as: nil
    put "user", to: "devise_invitable/registrations#update", as: :update_user_registration
    delete "user", to: "devise_invitable/registrations#destroy", as: :destroy_user_registration
    get "password", to: "devise/passwords#new"
    post "password", to: "devise/passwords#create"
    get "password/edit", to: "devise/passwords#edit"
    patch "password", to: "devise/passwords#update"
    put "password", to: "devise/passwords#update", as: :update_user_password
  end

  # devise_scope :user do
  #   get "/", to: "devise/sessions#destroy", as: :destroy_user_session
  # end

  # devise_scope :user do
  #   get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  namespace :doctor do
    resources :reservations
    resources :clinics
    resources :informations
  end

  resources :doctors
  resources :patients

  namespace :patient do
    resources :reservations
    resources :clinics
  end

end
