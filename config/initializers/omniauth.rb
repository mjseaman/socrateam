OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	# provider :developer unless Rails.env.production?
  provider :linkedin, 'l46alzitetea', 'iBEYThtT83rhinib'
end