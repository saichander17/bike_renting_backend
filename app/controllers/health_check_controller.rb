class HealthCheckController
	def health_check
		render json: {success: true}
	end
end