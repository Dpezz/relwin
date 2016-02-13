class Tax < ActiveRecord::Base
<<<<<<< HEAD
  has_many :in_taxes, dependent: :nullify

  #Validations
  validates :name, :value, presence: true
  validates :name, uniqueness: true
end
=======
  belongs_to :product
end
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
