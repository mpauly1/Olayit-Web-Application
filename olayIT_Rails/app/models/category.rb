class Category < ActiveRecord::Base
	validates :categoryname, presence: true, uniqueness:true
end
