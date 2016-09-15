Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :developer unless Rails.env.production?
  provider :learn, ENV['LEARN_OAUTH_APP_ID'], ENV['LEARN_OAUTH_APP_SECRET'],
  provider_ignores_state: true
end
