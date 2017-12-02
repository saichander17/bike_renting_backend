class BikeNumber < ApplicationRecord
	belongs_to :bike
  before_validation :set_is_deleted_and_is_active

  def available?(start_time,end_time)
  	start_time ||= Time.now
  	end_time ||= start_time
  	return false if (Order.where(bike_number_id: self.id).where("start_time > #{end_time} or end_time < #{start_time}").length>0)
  	return true
  end

  private
	def set_is_deleted_and_is_active
		self.is_deleted ||= false
		self.is_active ||= true
		self.is_active = false if is_deleted
	end
end
