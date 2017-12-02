class User < ApplicationRecord
	has_many :orders
	before_save :downcase_email

	def downcase_email
		self.email.downcase! if self.email
	end
end
