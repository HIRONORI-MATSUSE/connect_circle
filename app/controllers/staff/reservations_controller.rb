class Staff::ReservationsController < ApplicationController

    before_action :set_clinic, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.html # => 通常のURLの場合、index.html.erb が返される
      format.json { render json: @reservation } # URLが.jsonの場合、@products.to_json が返される
    end
  end

     
  def edit
    @reservation = @clinic.reservations.find(params[:id])
  end

  def update
    @reservation = @clinic.reservations.find(params[:id])
    @reservation.assign_attributes(reservation_params)
      if @reservation.double_booking?
        @reservation.update(reservation_params)
        redirect_to staff_clinic_path(@clinic), notice: '編集しました'
      else
        @reservation = Reservation.find(params[:id])
        redirect_to staff_clinic_path(@clinic), notice: 'すでに予約が入っています。編集できませんでした。'
      end
  end

  def show
    @reservations = @clinic.reservations
  end

  def edit
    @reservation = @clinic.reservations.find(params[:id])
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
    @clinic = Clinic.find(current_user.doctor.clinic.id)
  end

  def reservation_params
    params.require(:reservation).permit(:start, :end_time)
  end
end
