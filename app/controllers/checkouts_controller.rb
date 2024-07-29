class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    product_id = "prod_QYuYsqiGk6sNjd" # Your product ID
    price = Stripe::Price.list(product: product_id).data.first

    @checkout_session = current_user
      .payment_processor
      .checkout(
        mode: "payment",
        line_items: [{
          price: price.id,
          quantity: 1,
        }],
        success_url: checkout_success_url,
      )
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error: #{e.message}"
    render plain: "Invalid request to Stripe: #{e.message}", status: :bad_request
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @line_items = Stripe::Checkout::Session.list_line_items(params[:session_id])
  end
end
