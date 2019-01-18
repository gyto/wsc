class AddStatusAndContentToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :content, :text
    add_column :orders, :status, :string
  end
end
