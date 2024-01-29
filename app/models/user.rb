class User < ApplicationRecord
	has_many :orders
	has_many :deliver_adresses
	validates :username, presence: true, uniqueness: true, length: { in: 6..20 }
	validates :first_name, presence: true, length: { in: 2..20 }
	validates :last_name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: true, length: { in: 5..30 }
	validates :password, presence: true, length: { minimum: 6 }
	has_secure_password
end
