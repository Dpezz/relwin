class Ticket < ActiveRecord::Base
  belongs_to :payment
  belongs_to :user
  has_one :order, dependent: :nullify
  has_one :buy, dependent: :nullify

  #validate
  validates :code, :price, :payment, :date, presence: true
  validates_uniqueness_of :code, scope: :user_id
end