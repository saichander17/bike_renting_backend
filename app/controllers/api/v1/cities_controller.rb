class Api::V1::CitiesController < ApplicationController
	def index
		render json: {cities: City.all}
	end
end