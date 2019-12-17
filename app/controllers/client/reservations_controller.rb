class Client::ReservationsController < ApplicationController
  # def index
  #   if current_user.patient
  #     @events = Event.where(user_id: current_user)
  #   end
  # end
  def index
    @reservations = Reservation.all
    respond_to do |format|
      format.html # => 通常のURLの場合、index.html.erb が返される
      format.json { render json: @re } # URLが.jsonの場合、@products.to_json が返される
    end
  end
end
