class Stock < ActiveRecord::Base
  belongs_to :user
  has_many :in_stocks, dependent: :destroy

  #Validations
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
end