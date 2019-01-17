class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :catalog

  validates :print_type, :media, :billing_type, presence: true
end