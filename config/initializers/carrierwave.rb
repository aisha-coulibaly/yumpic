unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIASRJ4YSMWH3MTMA4N',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'rails-photo-123'
    config.cache_storage = :fog
  end
end