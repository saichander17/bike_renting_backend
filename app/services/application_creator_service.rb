class ApplicationCreatorService
	def initialize user, params, opts={}
    @user = user
    @params = params.dup.with_indifferent_access
    @opts = opts.with_indifferent_access
    @errors = Hash.new
    @result = nil
  end
  attr_reader :errors
end