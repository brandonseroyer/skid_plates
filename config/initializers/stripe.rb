Rails.configuration.stripe = {
  :publishable_key => 'pk_test_AxegOu7qx6vTpwp1ifuM6puz',
  :secret_key      => 'sk_test_s9Adjgaaq2j9LNSHezbiVvQh'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
