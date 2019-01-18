class AddCatalogIdToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :catalog_id, :integer
  end
end
