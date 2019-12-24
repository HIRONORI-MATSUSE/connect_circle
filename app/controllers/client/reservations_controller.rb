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
      format.json { render json: @re } # URLが.jsonの場合、@products.to_json が返される
    end
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    # @reservations = Reservation.all.includes(:clinic)
    @reservation = @clinic.reservations.build(reservation_params)
    @reservation.patient = current_user.patient
    @date_reservation = []

    Reservation.all.each do |reservation|
      @date_reservation.push([*reservation.start.to_i..reservation.end.to_i])
    end

    result = []
   
    binding.pry
    @date_reservation.each do |reservation|
      result.push(reservation & [*@reservation.start.to_i..@reservation.end.to_i])  
    end 

    if result.flatten.empty?
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
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to client_clinic_path(@clinic), notice: '編集しました' }
        format.json { render :index }
      else
        format.html { redirect_to client_clinic_path(@clinic), notice: '編集できませんでした。.' }
        format.json { render :index }
      end
    end
  end


  def destroy
    @reservation = Reservation.find(params[:id])
    respond_to do |format|
      if @reservation.destroy
        format.html { redirect_to client_clinic_path(@clinic), notice: '削除しました.' }
        format.json { render :index }
      else
        format.html { redirect_to client_clinic_path(@clinic), notice: '削除できませんでした。.' }
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

  def set_js
    gon.clinic_id = @clinic.id
  end
end
