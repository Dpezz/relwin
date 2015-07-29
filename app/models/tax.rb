class Tax < ActiveRecord::Base
  has_many :in_taxes, dependent: :nullify

  #Validations
  validates :name, :value, presence: true
  validates :name, uniqueness: true
end