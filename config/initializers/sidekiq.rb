Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://localhost:6379/10', namespace: 'store' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://localhost:6379/10', namespace: 'store' }
end
