class Client::ClinicsController < ApplicationController
before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @clinics = Clinic.all.page(params[:page]).per(10)
    if params[:clinic].present?
      @clinics = Clinic.name_address_search(params[:clinic][:name_address_search]).page(params[:page]).per(10)
    end 
  end

  def show
    @reservations = current_user.patient.reservations
    @reservations = @reservations.recent.order(start: :asc)
    @reservations = @reservations.page(params[:page]).per(10)   
  end

  def destroy
    @reservations = current_user.patient.reservations
    @reservation = @reservations.find(params[:id])
    respond_to do |format|
      if @reservation.destroy
        format.html { redirect_to client_clinic_path (@clinic), notice: '予約をキャンセルしました' }
        format.json { render :index }
      else
        format.html { redirect_to client_clinic_path(@clinic), notice: '予約をキャンセルできませんでした。' }
        format.json { render :index }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    @email = @user.email
  end

  
  private

  def set_clinic
    @clinic = Clinic.find(params[:id])
  end

  def clinic_params
    params.require(:clinic).permit(:name, :address, :phone_number, :image, :image_cache)
  end

end
