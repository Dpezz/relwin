class Client < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
  has_many :sales, dependent: :nullify

  #validate
  validates :rut, :name, presence: true
  validates_uniqueness_of :rut, scope: :user_id
end
=======
end
>>>>>>> c66483081cf83138a2aa6b061be26ceefc71112f
