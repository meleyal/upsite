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

  desc 'S3'
  task s3: :environment do
    s3 = AWS::S3.new
    bucket = s3.buckets[ENV['S3_BUCKET_NAME']]

    Attachment.all.each do |attachment|
      old_objects = [
        bucket.objects[attachment.upload.old_path],
        bucket.objects[attachment.upload.old_path(:medium)],
        bucket.objects[attachment.upload.old_path(:medium_2x)]
      ]
      new_objects = [
        bucket.objects[attachment.upload.path.gsub('/', '')],
        bucket.objects[attachment.upload.path(:medium).gsub('/', '')],
        bucket.objects[attachment.upload.path(:medium_2x).gsub('/', '')]
      ]

      puts "Moving object from #{attachment.upload.old_path} to #{attachment.upload.path.gsub('/', '')}"

      old_objects.each_with_index do |old, index|
        old.copy_to(new_objects[index], acl: :public_read)
      end
    end
  end

  desc 'S3 cleanup'
  task s3_cleanup: :environment do
    s3 = AWS::S3.new
    bucket = s3.buckets[ENV['S3_BUCKET_NAME']]

    Attachment.all.each do |attachment|
      old_objects = [
        bucket.objects[attachment.upload.old_path],
        bucket.objects[attachment.upload.old_path(:medium)],
        bucket.objects[attachment.upload.old_path(:medium_2x)]
      ]

      puts "Deleting object #{old_objects.join(', ')}"
      old_objects.each do |old|
        old.delete
      end
    end
  end
end
