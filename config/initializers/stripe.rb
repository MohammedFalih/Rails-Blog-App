Rails.configuration.stripe = {
  public_key: Rails.application.credentials.dig(:stripe, :public_key),
  private_key: Rails.application.credentials.dig(:stripe, :private_key),
  signing_key: Rails.application.credentials.dig(:stripe, :signing_key)
}

Stripe.api_key = Rails.configuration.stripe[:private_key]
