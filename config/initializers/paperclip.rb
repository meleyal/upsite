Paperclip.interpolates :app_name do |attachment, style|
  Rails.application.class.name.split('::').first.parameterize
end

Paperclip::Attachment.default_options[:s3_host_name] = 's3-eu-west-1.amazonaws.com'
Paperclip::Attachment.default_options[:s3_protocol] = ''


# TODO: Remove after migration

require 'openssl'

module Paperclip
  class Attachment

    # Old path overrides
    def old_path(style_name = default_style)
      path = original_filename.nil? ? nil : interpolate(old_path_option, style_name)
      path.respond_to?(:unescape) ? path.unescape : path
    end

    def old_path_option
      ":app_name_:old_hash_:style.:extension"
    end

    def old_hash_key(style_name = default_style)
      data = interpolate(":class/:attachment/:id/:style/:updated_at", style_name)
      OpenSSL::HMAC.hexdigest(OpenSSL::Digest.const_get(@options[:hash_digest]).new,
        "QXBhFYdt2JU7ZINf", data)
    end
  end

  module Interpolations
    def old_hash attachment=nil, style_name=nil
      if attachment && style_name
        attachment.old_hash_key(style_name)
      else
        super()
      end
    end
  end
end
