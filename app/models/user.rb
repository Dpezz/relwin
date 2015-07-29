class User < ActiveRecord::Base
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
  	:recoverable, :rememberable, :trackable, :validatable
    belongs_to :user

    has_many :categories, dependent: :destroy
    has_many :providers, dependent: :destroy
    has_many :stocks, dependent: :destroy
    has_many :products, dependent: :destroy
    has_many :clients, dependent: :destroy
    has_many :in_terminals, dependent: :destroy
    has_many :terminals, dependent: :destroy
    has_many :vendors, dependent: :destroy
    has_many :in_vendors, dependent: :destroy
    has_many :sales, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :tickets, dependent: :destroy
    has_many :buys, dependent: :destroy
    has_many :users, dependent: :destroy

    validates :permission_level, presence: true
    validates_uniqueness_of :permission_level, scope: [:email, :user_id]
    include PermissionsConcern
    after_create :create_stock

    def create_stock
        stock = Stock.new(name: 'default', is_active: true, user_id: self.id) 
        stock.save
    end
end
