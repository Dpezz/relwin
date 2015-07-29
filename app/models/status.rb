class Status < ActiveRecord::Base
	has_many :orders, dependent: :nullify

	#validate
  	validates :name, presence: true
  	validates :name, uniqueness: true
end