class Price < ActiveRecord::Base
  belongs_to :product
  
  #Validates
  validates :product, presence: true
end