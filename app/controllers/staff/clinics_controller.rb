class Staff::ClinicsController < ApplicationController
before_action :set_clinic, only: [:show, :edit, :update]

  def show
    @informations = @clinic.informations
  end

  def edit
    @clinic = Clinic.find(params[:id])
  end

  def update
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      redirect_to clinic_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:name, :address, :phone_number, :image, :image_cache)
  end

  
end
