# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Airport.create(code: 'SFO')
Airport.create(code: 'NYC')
Airport.create(code: 'CDG')
Airport.create(code: 'FRA')
Flight.create(from_airport_id: 1, to_airport_id: 3, date: Time.now)
Flight.create(from_airport_id: 2, to_airport_id: 4, date: Time.now)
Flight.create(from_airport_id: 1, to_airport_id: 4, date: Time.now)
Flight.create(from_airport_id: 1, to_airport_id: 3, date: Time.now)
Flight.create(from_airport_id: 3, to_airport_id: 4, date: Time.now - 1.day)
Flight.create(from_airport_id: 3, to_airport_id: 4, date: Time.now)
Flight.create(from_airport_id: 3, to_airport_id: 4, date: Time.now + 1.day)

