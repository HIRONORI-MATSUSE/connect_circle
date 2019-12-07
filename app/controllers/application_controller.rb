class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_up_path_for(resource)
    if current_user.doctor
      doctor_path(resource)
    else
      patient_path(resource)
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.doctor
      doctor_path(resource)
    else
      patient_path(resource)
    end
  end

  def after_update_path_for(resource)
    if current_user.doctor
      doctor_path(resource)
    else
      patient_path(resource)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [doctor_attributes: [:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :admin] ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [patient_attributes: [:name, :name_kana, :gender, :birthday, :address, :phone_number, :image]])
  end
end
