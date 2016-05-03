class Review < ActiveRecord::Base
	validates :customer_id, presence: true
	validates :squad_id, presence: true
	validates :reviewdate, presence: true
	validates :comments, presence: true
	validates :rating, presence: true
	validates :status, presence: true

	belongs_to :customer
	belongs_to :squad
end
