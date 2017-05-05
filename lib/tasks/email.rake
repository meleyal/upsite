namespace :email do
  desc 'Newsletter'
  task :newsletter => :environment do
    %w(
      katie-hill
      neonxlaser
      syiren
      gommagommas
      channelh
      captainhookkeptthemhooked
      pablo-sansone
      excursionesgeologicas
      haidutschek
      martinriemer
      cacciatore-ilustrado
      sarkhoshi
      ninos-fosforescentes
      wuni
      koru-consulting
    ).each do |subdomain|
      subject = "Changes to Upsite"
      s = Site.find_by(subdomain: subdomain)
      NotificationsMailer.newsletter_email(s, subject).deliver_now if s
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
