Rails.application.routes.draw do
  
  get 'informations/index'
  get 'informations/new'
  get 'reservations/index'
  get 'clinics/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_scope :user do
    get "/" => "devise/registrations#new", as: "new_user_registration"
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :doctor do
    resources :reservations
    resources :clinics
    resources :informations
  end
  
  resources :doctors
  namespace :user do
    resources :patient
  end

end
