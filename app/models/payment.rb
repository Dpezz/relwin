class Payment < ActiveRecord::Base
	has_many :pays, dependent: :nullify

	#validate
  	validates :name, presence: true
  	validates :name, uniqueness: true
end