class FlightsController < ApplicationController

  def index
    @flight = Flight.new
    @flight_from_options = (Flight.all.map { |flight| [flight.from_airport.code, flight.from_airport.code] }).uniq
    @flight_to_options = (Flight.all.map { |flight| [flight.to_airport.code, flight.to_airport.code] }).uniq
    @flight_date_options = (Flight.all.map { |flight| [flight.date.strftime("%Y-%m-%d"), flight.date.strftime("%Y-%m-%d")] if !flight.date.blank?}).uniq
    @num_tickets = [1,2,3,4]

    unless (params[:flight_date].blank? && params[:flight_from].blank? && params[:flight_to].blank?)
      @flight_search = Flight.search(params[:flight_date], params[:flight_from], params[:flight_to])
      @n_passengers = params[:num_tickets]
    end

#    respond_to do |format|
#      format.html {redirect_to root_path}
#      format.js
#    end

  end 
end
