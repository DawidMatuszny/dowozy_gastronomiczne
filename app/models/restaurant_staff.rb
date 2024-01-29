class RestaurantStaff < ApplicationRecord
	validates :username, presence: true, uniqueness: true, length: { in: 2..5 }
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
end
