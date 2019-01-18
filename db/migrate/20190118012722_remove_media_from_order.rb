class RemoveMediaFromOrder < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :media
  end
end
