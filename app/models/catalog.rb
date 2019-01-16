class Catalog < ActiveRecord::Base
  has_many :orders
end