class InVendor < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  has_many :sales, dependent: :nullify

  #validate
  validates :vendor, :start_date, presence: true
end