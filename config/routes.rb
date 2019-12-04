Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  devise_for :users, controllers: { registrations: 'users/registrations' }

  namespace :user do
    resources :doctor
    resources :patient 
  end

end
