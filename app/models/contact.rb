# frozen_string_literal: true

# Contact Model
class Contact < ActiveRecord::Base
  validates :name, :email, presence: true
end
