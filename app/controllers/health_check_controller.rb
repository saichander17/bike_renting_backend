class HealthCheckController < ApplicationController
	def health_check
		render json: {success: true}
	end
end