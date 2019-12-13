class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:show]
  # before_action :login_new


  def after_sign_up_path_for(resource)
    if current_user.doctor
      doctor_path(resource.doctor)
    else
      patient_path(resource.patient)
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.doctor
      doctor_path(resource.doctor)
    else
      patient_path(resource.patient)
    end
  end

  def after_update_path_for(resource)
    if current_user.doctor
      doctor_path(resource.doctor)
    else
      patient_path(resource.patient)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [doctor_attributes: [:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :image_cache, :admin] ])
    devise_parameter_sanitizer.permit(:sign_up, keys: [patient_attributes: [:name, :name_kana, :gender, :birthday, :address, :phone_number, :image, :image_cache]])
  end

  def login_new
    if user_signed_in? && current_user.doctor.admin?
      redirect_to new_user_registration_path
    elsif user_signed_in? && !current_user.doctor.admin?
      redirect_to doctor_path(current_user)
    else
      redirect_to patient_path(current_user)      
    end
  end

end
