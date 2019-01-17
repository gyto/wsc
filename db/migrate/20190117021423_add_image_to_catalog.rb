class AddImageToCatalog < ActiveRecord::Migration[5.2]
  def change
    add_column :catalogs, :image, :string
  end
end
