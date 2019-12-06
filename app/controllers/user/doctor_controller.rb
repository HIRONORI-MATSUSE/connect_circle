class User::DoctorController < ApplicationController

  def index
    @doctor = Doctor.all
  end

  def show
    @doctors = Doctor.all
    @patients = Patient.all
  end

  def edit
  end

  private

  def doctor_params
    params.require(:doctor).permit(:sign_up, keys: [doctor_attributes: [:name, :name_kana, :gender, :birthday, :phone_number, :comment, :image, :image_cache, :admin] ])
  end

end