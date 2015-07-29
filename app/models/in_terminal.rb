class InTerminal < ActiveRecord::Base
  belongs_to :terminal
  belongs_to :vendor
  belongs_to :user
  has_many :pays, dependent: :nullify

  #validate
  validates :terminal, :vendor, :start_p, :start_date, presence: true
end