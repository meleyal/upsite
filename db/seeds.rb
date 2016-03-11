# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

free_plan = Plan.create(name: 'Free', code: 'free', cost_per_year: 0)
pro_plan = Plan.create(name: 'Pro', code: 'pro', cost_per_year: 0)

['Upsite.', 'Help'].each do |name|
  user = User.create(email: 'admin@upsite.io', password: 'password', plan: pro_plan)
  site = Site.create(name: name, owner: user)
  SiteMembership.create(site: site, user: user)
end

['Billions & Billions', 'Meleyal', 'syrrup'].each do |name|
  user = User.create(email: 'william.meleyal@gmail.com', password: 'password', plan: pro_plan)
  site = Site.create(name: name, owner: user)
  SiteMembership.create(site: site, user: user)
end

['Lo', 'Cierva'].each do |name|
  user = User.create(email: 'luciagbequio@gmail.com', password: 'password', plan: pro_plan)
  site = Site.create(name: name, owner: user)
  SiteMembership.create(site: site, user: user)
end
