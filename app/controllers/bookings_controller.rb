class BookingsController < ApplicationController

  def new
    @p_num = params[:num_passengers]
    @flight_selected = Flight.find(params[:id])
    @new_booking = Booking.new
    (@p_num.to_i).times { @new_booking.passengers.build}
  end

  def create
    booking = Booking.new
    booking.passengers.build(booking_params[:passenger])
    flight = Flight.find(params[:flight_id])
    booking.flight = flight
  
    if booking.save
      redirect_to booking
    else
      redirect_to root_path
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(passenger: [:name, :email])
  end
end
