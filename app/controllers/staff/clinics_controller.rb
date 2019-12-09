class Staff::ClinicsController < ApplicationController
before_action :set_clinic, only: [:show, :edit, :update]

  def show
  end

  def edit
    # @user = User.find(params[:id])
    # @email = @user.email
  end

  def update
    # @clinic = Clinic.find(params[:id])
    # if @clinic.update(clinic_params)
    #   redirect_to clinic_path, notice: '編集しました'
    # else
    #   render 'edit'
    # end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:name, :address, :phone_number, :image, :image_cache)
  end

  def information_params
    params.require(:information).permit(:comment)
  end
end
