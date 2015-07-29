class InOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  #validate
  validates :product, :unit_o, presence: true
  validates :product, uniqueness: true
end