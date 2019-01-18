# frozen_string_literal: true

# Catalog Helper
module CatalogsHelper
  def billing_type
    ['Pay In Full', 'Payment On Delivery']
  end

  def print_type
    %i[Print Engraving]
  end
end