class Terminal < ActiveRecord::Base
  belongs_to :user
  has_many :in_terminals, dependent: :destroy
  has_many :pays, dependent: :nullify

  #validate
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
end