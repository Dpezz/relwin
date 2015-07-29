class Item < ActiveRecord::Base
  belongs_to :product
  belongs_to :sale

  #validate
  validates :product, :unit, presence: true
  validates_uniqueness_of :product, scope: :sale_id
end