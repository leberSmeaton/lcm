# my original line
Stripe.api_key = Rails.application.credentials.dig(:stripe, :secret_key)

# change it to this?
# Rails.configuration.stripe = {
# :stripe_api_key => ENV['STRIPE_API_KEY']
# }
# Stripe.api_key = Rails.configuration.stripe[:stripe_api_key]