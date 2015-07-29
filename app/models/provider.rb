class Provider < ActiveRecord::Base
  belongs_to :user
  has_many :products, dependent: :nullify

  #Validations
  validates :rut, :name, presence: true
  validates_uniqueness_of [:rut, :name], scope: :user_id
end