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
    Plan.create(name: 'Promo', code: 'promo', cost_per_month: 0, site_limit: 10, block_limit: 1000)
    Plan.free.update(cost_per_month: 0, site_limit: 1, block_limit: 12)
    Plan.pro.update(name: 'Pro', code: 'pro_5', cost_per_month: 500, site_limit: 5, block_limit: 1000)
  end

  desc 'Send welcome email to markdown users'
  task :send_welcome_email_to_markdown_users => :environment do
    Site.all.where("created_at >= ?", Time.new(2016, 11, 2, 14, 50)).select(&:markdown?).each do |site|
      next if site.owner.email == 'monkeygrip@gmail.com'
      NotificationsMailer.welcome_markdown_email(site.owner, "http://#{site.subdomain}.upsite.io/").deliver_now
    end
  end
end
