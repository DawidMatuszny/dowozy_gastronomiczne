class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
	scope :in_progress, -> { where(status: 1) }
end
