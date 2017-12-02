class Order < ApplicationRecord
	include BikeHelper
	belongs_to :user
	has_one :bike_number
	has_one :bike
	validates_presence_of :user_id
	validates_presence_of :bike_id
	after_validation :assign_bike_number

	def assign_bike_number
		available_bike_numbers = get_available_bike_number_ids_for_bike(self.bike_id,self.start_time,self.end_time,self.location_id)
		if available_bike_numbers.length>0
			self.bike_number_id = available_bike_numbers[0]
			if available_bike_numbers[0].blank?
				errors.add(:bike, "is not available for given time slot and location")
				return false
			end
			return true 
		end
		errors.add(:bike, "is not available for given time slot and location")
		false
	end
end
