class Account < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :address1, :city, :state, :zip_code, presence: true
end