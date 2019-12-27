class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.patient
      @reservation = current_user.patient.reservations
    else
      @reservation = Reservation.all
    end
    respond_to do |format|
      format.html # => 通常のURLの場合、index.html.erb が返される
      format.json { render json: @reservation } # URLが.jsonの場合、@products.to_json が返される
    end
  end


  def create
    if current_user.patient
      @patient = Patient.find(params[:patinet_id])
      @reservation = @patient.reservations.build(reservation_params)
      respond_to do |format|
        if @reservation.save
          format.html { redirect_to client_clinic_path(@patinet), notice: '作成しました' }
          format.json { render :index }
        else
          format.html { redirect_to client_clinic_path(@patinet), notice: '作成できませんでした。.' }
          format.json { render :index }
        end
      end
    else
      @doctor = Doctor.find(params[:doctor_id])
      @reservation = @doctor.reservations.build(reservation_params)
      respond_to do |format|
        if @reservation.save
          format.html { redirect_to staff_clinic_path(@doctor), notice: '作成しました' }
          format.json { render :index }
        else
          format.html { redirect_to staff_clinic_path(@doctor), notice: '作成できませんでした。.' }
          format.json { render :index }
        end
      end
    end
  end

  def update
    if current_user.patient
      @patient = Patient.find(params[:patinet_id])
      @reservation = @patient.reservations.build(reservation_params)
      respond_to do |format|
        if @reservation.update(reservation_params)
          format.html { redirect_to client_clinic_path(@patinet), notice: '編集しました' }
          format.json { render :index }
        else
          format.html { redirect_to client_clinic_path(@patinet), notice: '編集できませんでした。.' }
          format.json { render :index }
        end
      end
    else
      @doctor = Doctor.find(params[:doctor_id])
      @reservation = @doctor.reservations.build(reservation_params)
      respond_to do |format|
        if @reservation.update(reservation_params)
          format.html { redirect_to staff_clinic_path(@doctor), notice: '編集しました' }
          format.json { render :index }
        else
          format.html { redirect_to staff_clinic_path(@doctor), notice: '編集できませんでした' }
          format.json { render :index }
        end
      end
    end
  end

  def show
  end

  def edit
  end


  def destroy
    if current_user.patient
      @patient = Patient.find(params[:patinet_id])
      @reservation = @patient.reservations.build(reservation_params)
      respond_to do |format|
        if @reservation.destroy
          format.html { redirect_to client_clinic_path(@patinet), notice: '削除しました.' }
          format.json { render :index }
        else
          format.html { redirect_to client_clinic_path(@patinet), notice: '削除できませんでした。.' }
          format.json { render :index }
        end
      end
    else
      @doctor = Doctor.find(params[:doctor_id])
      @reservation = @doctor.reservations.build(reservation_params)
      respond_to do |format|
        if @reservation.destroy
          format.html { redirect_to staff_clinic_path(@doctor), notice: '削除しました' }
          format.json { render :index }
        else
          format.html { redirect_to staff_clinic_path(@doctor), notice: '削除できませんでした。' }
          format.json { render :index }
        end
      end
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:patinet_id, :doctor_id,:date, :time)
  end

end
