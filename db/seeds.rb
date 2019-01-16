# Create Roles
role = Role.new
role.name = 'admin'
role.save!

role = Role.new
role.name = 'customer'
role.save!

# Create Admin Users
User.destroy_all

admin = User.new
admin.email = 'gyto23@gmail.com'
admin.password = 'password'
admin_role = Role.find_by_name('admin')
admin.roles << admin_role
admin.save!