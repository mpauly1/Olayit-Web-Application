class OrderItem < ActiveRecord::Base
	validates :order_id, presence: true, uniqueness: true
	validates :squad_id, presence: true
	validates :saleprice, presence: true, numericality: true

	belongs_to :order
	belongs_to :squad
end
