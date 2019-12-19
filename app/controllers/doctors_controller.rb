class DoctorsController < ApplicationController
before_action :set_doctor, only: [:show, :edit, :update, :destroy]


  def index
    # @doctors = Doctor.order :name
    # @doctors = Doctor.name_kana
    @doctors = Doctor.all.sort{|d1, d2| d1.name_kana[0].casecmp(d2.name_kana[0])}
    @doctors = Doctor.revive_active_record(@doctors).page(params[:page]).per(10)
    if params[:doctor].present?
      @doctors = @doctors.doctor_name_search(params[:doctor][:name_search]).page(params[:page]).per(10)
    end 
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

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :image_cache, :admin)
  end

  def user_params
    params.require(:doctor).permit(:email, :password, :password_confirmation)
  end

  
end
