Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # devise_for :users, controllers: { registrations: 'users/registrations' } 
  # resources :doctors 
  # resources :patients
  


  devise_for :users, :controllers => {:registrations => "registrations"} do
    # get "communities/:community_id/sign_up" => "registrations#new", :as => :new_community_user_registration
    get "users/:user_id/users/sign_up" => "registrations#new", :as => :new_user_registration
    post "users/:user_id/users" => "registrations#create", :as => :user_registration
  end

end
