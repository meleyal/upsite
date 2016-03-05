# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

free_plan = Plan.create(name: 'Free', code: 'free', cost_per_year: 0)
pro_plan = Plan.create(name: 'Pro', code: 'pro', cost_per_year: 35)

user = User.create(email: 'william.meleyal@gmail.com', password: 'password', password_confirmation: 'password', plan: free_plan)

['Upsite.', 'Help', 'Billions & Billions', 'Meleyal'].each do |name|
  site = Site.create(name: name, owner: user)
  SiteMembership.create(site: site, user: user)
end
