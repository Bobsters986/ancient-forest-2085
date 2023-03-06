class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def unique_adult_names_by_flight_count
    # passengers.where("passengers.age > 18").distinct.order(:name).pluck(:name)
    passengers.select("passengers.*, count(flight_passengers.id) as flight_count").where("passengers.age > 18").group(:id).order("flight_count desc, name asc")
  end
end
