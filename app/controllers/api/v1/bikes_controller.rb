class BikeController < ApplicationController
	include BikeHelper
	def fetch_available_bikes
		render json: {success: true, availbale_bikes: get_available_bikes(params[:start_time], params[:end_time], params[:location_id])}
	end
end