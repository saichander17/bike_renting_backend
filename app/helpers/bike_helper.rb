module BikeHelper
	def get_available_bikes(start_time,end_time,location_id)
		# bike_numbers = BikeNumber.where(location_id: location_id)
		# bike_number_ids = bike_numbers.map{|bn| bn.id}
		bike_number_ids = BikeNumber.where(location_id: location_id).pluck(:id)
  	unavailable_bike_number_ids = Order.where(bike_number_id: bike_number_ids).where("(start_time < '#{start_time}' and end_time > '#{start_time}') or (start_time < '#{end_time}' and end_time > '#{end_time}')").pluck(:bike_number_id).uniq
  	available_bike_number_ids = bike_number_ids - unavailable_bike_number_ids
  	available_bike_ids = BikeNumber.where(id: available_bike_number_ids).pluck(:bike_id).uniq
  	return Bike.where(id: available_bike_ids)
	end

	def get_available_bike_number_ids_for_bike(bike_id,start_time,end_time,location_id)
  	bike_number_ids = BikeNumber.where(bike_id: bike_id, location_id: location_id).pluck(:id)
  	unavailable_bnis = Order.where(bike_number_id: bike_number_ids).where("(start_time < '#{start_time}' and end_time > '#{start_time}') or (start_time < '#{end_time}' and end_time > '#{end_time}')").pluck(:bike_number_id).uniq
  	return (bike_number_ids - unavailable_bnis)
  end
end