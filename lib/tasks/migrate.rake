namespace :migrate do
  desc 'Subscribe all users to free plan'
  task :subscribe_all_users_to_free_plan => :environment do
    User.all.each do |u|
      Subscription.create(user: u, plan: Plan.free, starts_at: Time.now)
      customer = Stripe::Customer.create(email: u.email, plan: Plan.free.code)
      u.update(stripe_customer_id: customer.id)
    end
  end

  desc 'Plans'
  task :plans => :environment do
    Plan.free.update(block_limit: 10000, invite_limit: 3)
    Plan.pro.update(block_limit: 10000, invite_limit: 10)
    Plan.promo.update(block_limit: 10000, invite_limit: 100)
  end
end
