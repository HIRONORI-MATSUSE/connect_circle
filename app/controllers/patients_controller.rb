class PatientsController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def index
    @patients = Patient.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    @email = @user.email
  end

  def update
    @patient = Patient.find(params[:id])
    @user = @patient.user
    if @user.update(user_params) && @patient.update(patient_params)
      redirect_to patient_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :name_kana, :gender, :birthday, :address, :phone_number, :image,:image_cache)
  end

  def user_params
    params.require(:patient).permit(:email, :password, :password_confirmation)
  end

end
