class Reorder < ActiveRecord::Base
	validates :squad_id, presence: true
	validates :qtyorder, presence: true
	validates :reorderdate, presence: true
	validates :expecteddelivery, presence: true

	belongs_to :squad
end
