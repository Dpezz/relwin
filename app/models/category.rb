class Category < ActiveRecord::Base
  belongs_to :user
  has_many :products, dependent: :nullify

#Validations
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
end