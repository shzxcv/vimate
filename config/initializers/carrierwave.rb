if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: "#{Rails.application.credentials.aws[:s3_key]}",
      aws_secret_access_key: "#{Rails.application.credentials.aws[:s3_secret]}",
      region: "#{Rails.application.credentials.aws[:s3_region]}"
    }

    config.fog_directory  = 'rails_user_avatar'
    config.cache_storage = :fog
    config.fog_public = false
    config.fog_authenticated_url_expiration = 60
  end
end
