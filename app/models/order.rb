class Order < ApplicationRecord
	include BikeHelper
	belongs_to :user
	has_one :bike_number
	has_one :bike_id
	validates_presence_of :user_id
	validates_presence_of :bike_id
	before_save :assign_bike_number

	def assign_bike_number
		available_bike_numbers = BikeNumber.get_available_bike_number_ids_for_bike(self.bike_id,self.start_time,self.end_time,self.location_id)
		return true if available_bike_numbers.length>0
		errors.add(:bike, "is not available for given time slot and location")
		false
	end
end
