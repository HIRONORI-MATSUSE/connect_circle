class Client::ReservationsController < ApplicationController
  # def index
  #   if current_user.patient
  #     @events = Event.where(user_id: current_user)
  #   end
  # end

  before_action :set_clinic, only: [:show, :edit, :update, :destroy]
  before_action :set_js, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.html # => 通常のURLの場合、index.html.erb が返される
      format.json { render json: @reservations } # URLが.jsonの場合、@products.to_json が返される
    end
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    @reservation = @clinic.reservations.build(reservation_params)
    @reservation.patient = current_user.patient

    if @reservation.double_booking?
       @reservation.save
       redirect_to client_clinic_path(@clinic), notice: '作成しました'
    else
      redirect_to client_clinic_path(@clinic), notice: 'すでに予約が入っています。予約できませんでした。'
    end
  end

  def show
  end


  def edit
    @reservation = @clinic.reservations.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.assign_attributes(reservation_params)
      if @reservation.double_booking?
        @reservation.update(reservation_params)
        redirect_to client_clinic_path(@clinic), notice: '編集しました'
      else
        @reservation = Reservation.find(params[:id])
        redirect_to client_clinic_path(@clinic), notice: 'すでに予約が入っています。編集できませんでした。'
      end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
      if @reservation.destroy
        redirect_to client_clinic_path(@clinic), notice: '削除しました.'
      else
        redirect_to client_clinic_path(@clinic), notice: '削除できませんでした。' 
      end
  end

  private

  def set_clinic
    @clinic = Clinic.find(params[:clinic_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start, :end_time)
  end

  def set_js
    gon.clinic_id = @clinic.id
  end
end
