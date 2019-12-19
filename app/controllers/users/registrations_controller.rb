# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  

  # GET /resource/sign_up
  def new
    @user = User.new
    
    # if current_user.try.admin?
    if user_signed_in? && current_user.doctor&.admin
      @doctor = @user.build_doctor
    else
      @patient = @user.build_patient
    end
  end

  # def after_sign_up_path_for(resource_name)
  #     patient_path(resource_name)
  # end

  def after_sign_in_path_for(resource_name)
    patient_path(resource_name)
  end

  # def after_update_path_for(resource_name)
  #   patient_path(resource_name)
  # end

  # POST /resource
  def create
    if current_user.doctor.admin?
      @user = User.new(doctor_params)
      @doctor = Doctor.new(
        user: @user, 
        clinic: current_user.doctor.clinic,
        admin: false
      )
      @doctor.save
        redirect_to staff_clinic_path(current_user.doctor.clinic.id), notice: 'スタッフを作成しました'
    elsif current_user == nil
      @user = user.new(user_)
      @patient = Patient.new(patient_params)
      @patient.save
        redirect_to patient_path(current_user.patient.id), notice: '作成しました'
    else
        render 'new'
    
    end
  end
      

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def patient_params
    params.require(
      :user
    ).permit(
      :email, 
      :password, 
      :password_confirmation, 
      doctor_attributes: [
        :name, 
        :name_kana, 
        :gender, 
        :birthday, 
        :phone_number, 
        :address, 
        :image, 
        :image_cache, 
      ]
    )
  end

  def doctor_params
    params.require(
      :user
    ).permit(
      :email, 
      :password, 
      :password_confirmation, 
      doctor_attributes: [
        :name, 
        :name_kana, 
        :gender, 
        :birthday, 
        :phone_number, 
        :comment, 
        :image, 
        :image_cache, 
        :admin
      ]
    )
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [doctor_attributes: [:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :image_cache, :admin] ])
  end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end