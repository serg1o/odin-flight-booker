class Flight < ActiveRecord::Base
  belongs_to :from_airport, :foreign_key => :from_airport_id, :class_name => "Airport"
  belongs_to :to_airport, :foreign_key => :to_airport_id, :class_name => "Airport"
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.search(flight_date, from, to)
    #Flight.all.where("from_airport.code = ?", from).where("to_airport.code = ?", to)#where("date = ?", Date.parse(date))
    #Flight.joins(:from_airport, :to_airport).where(airports: {code: from}).where(airports: {code: to})
 #   query1 = Flight.joins(:from_airport).where(airports: {code: from})
#    query2 = Flight.joins(:to_airport).where(airports: {code: to})

    query = Flight.joins(:from_airport, :to_airport)
    unless to.blank?
      id_to = Airport.where(code: to).first.id 
      query = query.where(to_airport_id: id_to)
    end
    unless from.blank?
      id_from = Airport.where(code: from).first.id 
      query = query.where(from_airport_id: id_from)
    end
    unless flight_date.blank?
      query = query.where(date: (Time.parse(flight_date))..(Time.parse(flight_date) + 1.day)) 
    end
    query
   # Flight.joins(:from_airport, :to_airport).where(to_airport_id: id_to).where(from_airport_id: id_from)
   
 
  end
  
  #def format_date
  #  flight_date.strftime("%m/%d/%Y")
  #end

end
