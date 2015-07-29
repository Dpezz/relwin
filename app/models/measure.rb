class Measure < ActiveRecord::Base
	has_many :products, dependent: :nullify

	#Validates
	validates :name, :symbol, presence: true
	validates :name, :symbol, uniqueness: true
end