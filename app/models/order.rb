class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :catalog

  validates :print_type, :qty, :billing_type, :content, presence: true
end