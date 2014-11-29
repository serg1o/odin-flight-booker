class Passenger < ActiveRecord::Base
  #has_many :flights, through: :bookings
  belongs_to :booking
end
