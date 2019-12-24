class Staff::ClinicsController < ApplicationController
before_action :set_clinic, only: [:show, :edit, :update]

   def show
    @informations = @clinic.informations
    @reservations = @clinic.reservations.recent.order(start: :asc)
    @reservations = @reservations.page(params[:page]).per(10)
    if params[:sort_today]
      @reservations = @reservations.today
    end
  end

  def edit
  end

  def update
    @clinic = Clinic.find(params[:id])
    if @clinic.update(clinic_params)
      redirect_to staff_clinic_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

   def destroy
    @clinic = Clinic.find(current_user.doctor.clinic.id)
    @reservation = @clinic.reservations.find(params[:id])
    respond_to do |format|
      if @reservation.destroy
        format.html { redirect_to staff_clinic_path(@clinic), notice: '予約をキャンセルしました' }
        format.json { render :index }
      else
        format.html { redirect_to staff_clinic_path(@clinic), notice: '予約をキャンセルできませんでした。' }
        format.json { render :index }
      end
    end
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
