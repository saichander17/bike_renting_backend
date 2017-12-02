class OrderCreatorService < ApplicationCreatorService
	def create
		order = Order.new(user_id: @user.id,start_time: start_time,end_time: end_time)
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