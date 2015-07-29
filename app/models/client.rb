class Client < ActiveRecord::Base
  belongs_to :user
  has_many :sales, dependent: :nullify

  #validate
  validates :rut, :name, presence: true
  validates_uniqueness_of :rut, scope: :user_id
end