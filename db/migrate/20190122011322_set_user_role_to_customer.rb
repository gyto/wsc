class SetUserRoleToCustomer < ActiveRecord::Migration[5.2]
  def change
    User.all.each do |user|
      if user.role_ids.count.zero?
        user.roles << Role.find_by_name('customer')
      end
    end
  end
end
