class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :in_vendor
  belongs_to :user
  has_one :pay, dependent: :destroy
  has_many :items, dependent: :destroy

  #validate
  validates :in_vendor_id, presence: true
end