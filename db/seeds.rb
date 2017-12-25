# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

free_plan = Plan.create(name: 'Free', code: 'free', site_limit: 1, block_limit: 10000, invite_limit: 3)
pro_plan = Plan.create(name: 'Pro 10', code: 'pro_10', site_limit: 10, block_limit: 10000, invite_limit: 10)
promo_plan = Plan.create(name: 'Promo', code: 'promo', site_limit: 10, block_limit: 10000, invite_limit: 100)

admin = User.create(email: 'admin@upsite.io', password: 'password', plan: promo_plan)
me = User.create(email: 'william.meleyal@gmail.com', password: 'password', plan: promo_plan)

site = Site.create(name: 'meleyal')
site.transfer_ownership!(me)
