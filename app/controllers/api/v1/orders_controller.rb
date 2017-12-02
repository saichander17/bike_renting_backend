class Api::V1::OrdersController < ApplicationController
	# before_action :authenticate_user!
	def create
		if order_creation_service.create
			render json: {success: true}
		else
			render json: {success: false, errors: order_creation_service.errors}
		end
	end

	def show
		if order=Order.find_by(id: params[:id])
			if order.user_id==current_user.id
				render json: {success: true, order_details: OrderDecorator.new(order).as_json}
			else
				render json: {success: false, errors: {order: ["Not available"]}}
			end
		else
			render json: {success: false, errors: {order: ["Not available"]}}
		end
	end

	def index
		uid = current_user.id rescue User.first.id
		orders = Order.where(user_id: uid)
		res = []
		orders.each do |order|
			res<<OrderDecorator.new(order).as_json
		end
		render json: {success: true, order_details: res}
	end

	private
	def user_id
		@_user_id ||= params[:user_id] || 1					#TODO user_id should be equal to current_user.id once devise is done
	end

	def user
		@_user = User.find_by(id: user_id)
	end

	def order_creation_service
		@_order_creation_service ||= OrderCreatorService.new(user,{bike_id: params[:bike_id], start_time: params[:start_time], end_time: params[:end_time], location_id: params[:location_id]})
	end
end