Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :doctors do
     members :qualificate
  end
  resources :patients
end
