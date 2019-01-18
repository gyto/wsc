class AddQtyToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :qty, :integer
  end
end
