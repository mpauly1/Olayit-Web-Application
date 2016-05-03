class Squad < ActiveRecord::Base
	validates :squadname, presence: true, uniqueness: true
	validates :squadimage, presence: true
	validates :description, presence: true
	validates :category_id, presence: true
	validates :saleprice, presence: true, numericality: true
	validates :status, presence: true
	validates :purchaseprice, presence: true, numericality: true
	validates :qtyonhand, presence: true
	validates :reorderpoint, presence: true
	validates :reorderqty, presence: true

	has_many :order_item, dependent: :destroy
	has_many :reorder, dependent: :destroy
	has_many :review, dependent: :destroy
end
