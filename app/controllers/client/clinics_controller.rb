class Client::ClinicsController < ApplicationController
before_action :set_clinic, only: [:show, :edit, :update]

  def index
    @clinics = Clinic.all.page(params[:page]).per(10)
    if params[:clinic].present?
      @clinics = Clinic.name_address_search(params[:clinic][:name_address_search]).page(params[:page]).per(10)
    end 
  end

  def show
    
  end

  def edit
    @user = User.find(params[:id])
    @email = @user.email
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
