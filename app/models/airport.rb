class Airport < ActiveRecord::Base
 
  #has_many :departing_flights, :through => :flights, :source => :from_airport
  #has_many :arriving_flights, :through => :flights, :source => :to_airport
  has_many :departing_flights, class_name: "Flight", :foreign_key => :from_airport_id, :source => :from_airport
  has_many :arriving_flights, class_name: "Flight", :foreign_key => :to_airport_id, :source => :to_airport
end
