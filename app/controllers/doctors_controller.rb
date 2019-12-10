class DoctorsController < ApplicationController
before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
    @informations = @doctor.clinic.informations
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

  def destroy
    @doctor.destroy
    redirect_to doctors_path, notice:"治療家を削除しました！"
  end

  private

  def set_user
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :image_cache, :admin)
  end

  def user_params
    params.require(:doctor).permit(:email, :password, :password_confirmation)
  end

end
