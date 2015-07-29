class InTax < ActiveRecord::Base
  belongs_to :product
  belongs_to :tax

  #validate
  validates :tax, :product, presence: true
  validates_uniqueness_of :tax, scope: :product_id
end