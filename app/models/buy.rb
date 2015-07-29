class Buy < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  has_many :in_buys, dependent: :destroy
  
  #validate
  validates :date, presence: true
  validates_uniqueness_of :ticket, scope: :user_id
end