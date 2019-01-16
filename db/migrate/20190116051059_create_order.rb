class CreateOrder < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :print_type
      t.string :media
      t.string :billing_type

      t.timestamps
    end
  end
end
