Paperclip.interpolates :page_id do |attachment, style|
  attachment.instance.page.id
end

Paperclip.interpolates :app_name do |attachment, style|
  Rails.application.class.name.split('::').first.parameterize
end