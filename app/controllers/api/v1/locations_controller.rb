class Api::V1::LocationsController < ApplicationController
	def index
		render json: {locations: Location.where(city_id: params[:city_id])}
	end
end