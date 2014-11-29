class BookingsController < ApplicationController

  def new
    @p_num = params[:num_passengers]
    @flight_selected = Flight.find(params[:id])
    @flight_passengers = Array.new(@p_num.to_i, Passenger.new)
    @new_booking = Booking.new
  end

  def create
    array_pass = booking_params[:passenger]
    booking = Booking.new
    array_pass.each do |p|
      pass = Passenger.new(p)
      pass.booking = booking
      pass.save
    end
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
