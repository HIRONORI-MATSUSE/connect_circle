class Staff::InformationsController < ApplicationController
  before_action :set_information, only: [:edit, :update, :destroy]


  def new
    @information = Information.new
  end

  def create
    @information = current_user.doctor.clinic.informations.new(information_params)
    if @information.save
      redirect_to staff_clinic_path(current_user.doctor.clinic.id), notice: 'お知らせを作成しました'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @information = Information.find(params[:id])
    if @information.update(information_params)
      redirect_to staff_clinic_path, notice: 'お知らせを編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @information.destroy
    redirect_to staff_clinic_path, notice:"お知らせを削除しました！"
  end

  private

  def set_information
    @information = Information.find(params[:id])
  end

  def information_params
    params.require(:information).permit(:comment)
  end

end
