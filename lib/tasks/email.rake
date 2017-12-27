namespace :email do
  desc 'Newsletter'
  task :newsletter => :environment do
    Site.all.each do |site|
      subject = "TODO"
      NotificationsMailer.newsletter_email(site, subject).deliver_now
    end
  end
end
