class Order < ActiveRecord::Base
  belongs_to :status
  belongs_to :ticket
  belongs_to :user
  has_many :in_orders, dependent: :destroy

  #validate
  validates :code, presence: true
  validates_uniqueness_of [:code, :ticket], scope: :user_id
end