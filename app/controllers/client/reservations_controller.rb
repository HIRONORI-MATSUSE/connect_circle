class Client::ReservationsController < ApplicationController
  # def index
  #   if current_user.patient
  #     @events = Event.where(user_id: current_user)
  #   end
  # end

  before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.html # => 通常のURLの場合、index.html.erb が返される
      format.json { render json: @re } # URLが.jsonの場合、@products.to_json が返される
    end
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    @reservation = @clinic.reservations.build(reservation_params)
    @reservation.patient = current_user.patient
    
    respond_to do |format|
      if @reservation.save
        format.html { redirect_to client_clinic_reservation_path(@clinic), notice: '作成しました' }
        format.json { render :index }
      else
        format.html { redirect_to client_clinic_path(@patinet), notice: '作成できませんでした。.' }
        format.json { render :index }
      end
    end
  end
      

  def update
    @clinic = Clinic.find(params[:clinic_id])
    @reservation = @clinic.reservations.build(reservation_params)
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to client_clinic_path(@patinet), notice: '編集しました' }
        format.json { render :index }
      else
        format.html { redirect_to client_clinic_path(@patinet), notice: '編集できませんでした。.' }
        format.json { render :index }
      end
    end
  end

   def show
    @reservations = current_user.patient.reservations
    @reservations = @reservations.recent.order(start: :asc)
    @reservations = @reservations.page(params[:page]).per(10)
  end

  def edit
  end


  def destroy
    @clinic = Clinic.find(params[:clinic_id])
    @reservation = @clinic.reservations.build(reservation_params)
    respond_to do |format|
      if @reservation.destroy
        format.html { redirect_to client_clinic_path(@patinet), notice: '削除しました.' }
        format.json { render :index }
      else
        format.html { redirect_to client_clinic_path(@patinet), notice: '削除できませんでした。.' }
        format.json { render :index }
      end
    end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start, :end, :name)
  end
end
