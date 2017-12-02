class OrderCreatorService < ApplicationCreatorService
	def create
		uid=@user.id rescue 1
		order = Order.new(user_id: uid,start_time: start_time,end_time: end_time, location_id: location_id)
  	if order.save
  		return true
  	else
  		@errors = order.errors.messages
  		return false
  	end
  end

  private

  def bike
  	@_bike ||= Bike.find(@params[:bike_id])
  end

  def start_time
  	@params[:start_time]
  end

  def end_time
  	@params[:end_time]
  end

  def location_id
  	@params[:location_id]
  end
end