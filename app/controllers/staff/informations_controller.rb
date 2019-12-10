class Staff::InformationsController < ApplicationController

  def new
    @information = Information.new
  end

  def create
    @information = current_user.doctor.clinic.new(information_params)
    if @information.save
      redirect_to staff_clinic_path(current_user.doctor.clinic.id), notice: 'お知らせを作成しました'
    else
      render 'new'
    end
  end

  private

  def information_params
    params.require(:information).permit(:comment)
  end

end
