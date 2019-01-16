class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :job_title
      t.string :department

      t.timestamps
    end
  end
end
