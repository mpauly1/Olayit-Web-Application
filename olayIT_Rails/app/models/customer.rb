class Customer < ActiveRecord::Base
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	validates :email, uniqueness: true
    validates :firstName, presence: true
	validates :lastName, presence: true

	validates :username, :presence => true, :uniqueness => true
	has_secure_password

	def name
		"#{lastName}, #{firstName}"
	end

	# associations


  	has_many :order, dependent: :destroy
  	has_many :review, dependent: :destroy

end
