class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_one :account

  before_create :set_user_role_by_default

  def set_user_role_by_default
    self.roles << Role.find_by_name('customer') if self.role_ids.count.zero?
  end
end
