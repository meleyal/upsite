# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin = User.create(email: 'admin@upsite.io', password: 'password')
user = User.create(email: 'william.meleyal@gmail.com', password: 'password')

site = Site.create(title: 'meleyal')
site.update_attribute(:owner_id, user.id)
