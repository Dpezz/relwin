class Product < ActiveRecord::Base
<<<<<<< HEAD
  belongs_to :measure
  belongs_to :provider
  belongs_to :category
  belongs_to :user
  has_one :price, dependent: :destroy
  has_many :in_stocks, dependent: :destroy
  has_many :in_taxes, dependent: :destroy
  has_many :items, dependent: :nullify
  has_many :in_orders, dependent: :nullify
  has_many :in_buys, dependent: :nullify

  #Validations
  validates :code, :barcode, :name, :measure, :provider, presence: true
  validates_uniqueness_of [:code, :barcode, :name], scope: [:user_id]
end
=======
  belongs_to :provider
  belongs_to :category
  belongs_to :user
  has_one :price
  has_many :taxes
end
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
