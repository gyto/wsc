class AddCostFieldsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :item_price, :decimal
    add_column :orders, :total_price, :decimal
    add_column :orders, :content_length, :integer
    add_column :orders, :tax, :decimal, default: 0.08
  end
end
