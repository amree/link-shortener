require "sidekiq"
require "sidekiq/web"

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  credential = Rails.application.credentials.sidekiq || "sidekiq"
  [user, password] == [credential, credential]
end

Sidekiq.configure_server do |config|
  config.redis = {url: Rails.application.credentials.redis_url}
end

Sidekiq.configure_client do |config|
  config.redis = {url: Rails.application.credentials.redis_url}
end
