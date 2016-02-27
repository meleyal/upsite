# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


free_plan = Plan.create(name: 'Free', code: 'free', cost_per_year: 0)
pro_plan = Plan.create(name: 'Pro', code: 'pro', cost_per_year: 35)

user = User.create(email: 'william.meleyal@gmail.com', password: 'password', password_confirmation: 'password', plan: free_plan)

site1 = Site.create(name: "Meleyal", subdomain: 'meleyal', owner: user, settings: nil)
site2 = Site.create(name: "syrrup", subdomain: 'syrrup', owner: user, settings: nil)

membership = SiteMembership.create(site: site1, user: user)
membership = SiteMembership.create(site: site2, user: user)
