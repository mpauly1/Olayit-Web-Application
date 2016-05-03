class Order < ActiveRecord::Base
	validates :customer_id, presence:true
	validates :saledate, presence:true

	# associations
	belongs_to :customer
	has_many :order_item, dependent: :destroy

end
