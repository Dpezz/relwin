class InBuy < ActiveRecord::Base
  belongs_to :buy
  belongs_to :product

  #validate
  validates :product, :unit, presence: true
  validates_uniqueness_of :product, scope: [:buy, :user_id]
end