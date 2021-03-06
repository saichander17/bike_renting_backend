class Api::V1::BikesController < ApplicationController
	include BikeHelper
	def fetch_available_bikes
		available_bikes = get_available_bikes(params[:start_time], params[:end_time], params[:location_id])
		res = []
		available_bikes.each do |bike|
			res<<BikeDecorator.new(bike).as_json
		end
		render json: {success: true, availbale_bikes: res}
	end
end