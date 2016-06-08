# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

free_plan = Plan.create(name: 'Free', code: 'free', cost_per_year: 0)
pro_plan = Plan.create(name: 'Pro', code: 'pro', cost_per_year: 0)

admin = User.create(email: 'admin@upsite.io', password: 'password', plan: pro_plan)
me = User.create(email: 'william.meleyal@gmail.com', password: 'password', plan: pro_plan)

['Upsite'].each do |name|
  site = Site.create(name: name, owner: admin)
  SiteMembership.create(site: site, user: admin)
end

['Meleyal'].each do |name|
  site = Site.create(name: name, owner: me)
  SiteMembership.create(site: site, user: me)
end
