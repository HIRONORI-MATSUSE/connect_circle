class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [doctor_attributes: [:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :admin] ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [patient_attributes: [:name, :name_kana, :gender, :birthday, :address, :phone_number, :image]])
  end
end
