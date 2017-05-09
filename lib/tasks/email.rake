namespace :email do
  desc 'Newsletter'
  task :newsletter => :environment do
    Site.all.each do |site|
      subject = "Upsite is shutting down on 1 June 2017"
      NotificationsMailer.newsletter_email(site, subject).deliver_now
    end
  end

  desc 'Email dormant users'
  task :dormant => :environment do
    %w().each do |subdomain|
      s = Site.find_by(subdomain: subdomain)
      NotificationsMailer.dormant_email(s).deliver_now if s
    end
  end
end
