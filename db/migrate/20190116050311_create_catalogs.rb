class CreateCatalogs < ActiveRecord::Migration[5.2]
  def change
    create_table :catalogs do |t|
      t.string :name
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
