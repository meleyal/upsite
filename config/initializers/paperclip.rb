Paperclip.interpolates :site_id do |attachment, style|
  attachment.instance.site.id
end

Paperclip.interpolates :app_name do |attachment, style|
  Rails.application.class.name.split('::').first.parameterize
end