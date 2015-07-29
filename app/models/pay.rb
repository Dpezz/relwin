class Pay < ActiveRecord::Base
  belongs_to :sale
  belongs_to :in_terminal
  belongs_to :payment

  #validate
  validates :in_terminal, :payment, presence: true
end