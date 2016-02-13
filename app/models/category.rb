class Category < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
  has_many :products, dependent: :nullify

#Validations
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id
end
=======
  has_many :products
end
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
