class Api::V1::OrdersController < ApplicationController
	# before_action :api_authenticate_user!
	def create
		if order_creation_service.create
		else
		end
		# if Bike.find_by(id: params[:bike_id])
		# else
		# 	render json: {success: false, errors: {bike: ["Bike not found."]}}
		# end
	end

	private
	def user_id
		@_user_id ||= params[:user_id] || 1					#TODO user_id should be equal to current_user.id once devise is done
	end

	def user
		@_user = User.find_by(user_id)
	end

	def order_creation_service
		OrderCreatorService.new(user,{bike_id: params[:bike_id], start_time: params[:start_time], end_time: params[:end_time]})
	end
end