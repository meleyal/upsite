Paperclip.interpolates :app_name do |attachment, style|
  Rails.application.class.name.split('::').first.parameterize
end

Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-1.amazonaws.com'