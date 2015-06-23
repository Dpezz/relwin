class Product < ActiveRecord::Base
  belongs_to :provider
  belongs_to :category
  belongs_to :user
  has_one :price
  has_many :taxes
end
