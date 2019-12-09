class DoctorsController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    @email = @user.email
  end

  def update
    @doctor = Doctor.find(params[:id])
    @user = @doctor.user
    if @user.update(user_params) && @doctor.update(doctor_params)
      redirect_to doctor_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :image_cache, :admin)
  end

  def user_params
    params.require(:patient).permit(:email, :password, :password_confirmation)
  end

end
