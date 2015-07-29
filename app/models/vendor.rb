class Vendor < ActiveRecord::Base
  belongs_to :user
  has_many :sales, dependent: :nullify
  has_many :in_terminals, dependent: :nullify
  has_many :in_vendors, dependent: :nullify

  #validate
  validates :rut, :name, :plastname, :mlastname, presence: true
  validates_uniqueness_of :rut, scope: :user_id
end