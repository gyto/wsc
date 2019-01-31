# frozen_string_literal: true
# Create Admin Users
User.destroy_all

admin = User.new
admin.id = 1
admin.email = 'gyto23@gmail.com'
admin.password = 'password'
admin.admin = true
admin_role = Role.find_by_name('admin')
admin.roles << admin_role
admin.save!

# Create Account with Associated User
Account.destroy_all

account = Account.new
account.user_id = 1
account.first_name = 'Roman'
account.last_name = 'Kovtun'
account.address1 = '750 N Windsor Dr.'
account.address2 = 'Unit 305'
account.city = 'Arlington Heights'
account.state = 'IL'
account.zip_code = '60004'
account.job_title = 'Web Development'
account.department = 'Front End'
account.save!
