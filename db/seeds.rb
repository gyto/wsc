# Create Roles
Role.destroy_all

role = Role.new
role.name = 'admin'
role.save!

role = Role.new
role.name = 'customer'
role.save!

load(Rails.root.join('db', 'seeds', 'catalogs.rb'))
load(Rails.root.join('db', 'seeds', 'accounts.rb'))
