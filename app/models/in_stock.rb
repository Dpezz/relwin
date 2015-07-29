class InStock < ActiveRecord::Base
  belongs_to :stock
  belongs_to :product

  #validate
  validates :stock, :product, :unit, :limit, presence: true
  validates_uniqueness_of :stock, scope: :product_id
end