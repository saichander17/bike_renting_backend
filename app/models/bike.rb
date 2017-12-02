class Bike < ApplicationRecord
	has_many :bike_numbers

	def available?(start_time,end_time,location_id)
  	start_time ||= Time.now
  	end_time ||= start_time
  	bids = self.bike_numbers.where(location_id: location_id).pluck(:id)
  	unaviable_bids = Order.where(bike_number_id: bids).where(location_id: location_id).where("(start_time < '#{start_time}' and end_time > '#{start_time}') or (start_time < '#{end_time}' and end_time > '#{end_time}')").pluck(:bike_number_id).uniq
  	return true if (bids-unaviable_bids).length>0
  	return false
  end
end
