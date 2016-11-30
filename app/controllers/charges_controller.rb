class ChargesController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @email = Order.find(params[:order_id]).email
    @first_name = Order.find(params[:order_id]).first_name
    @last_name = Order.find(params[:order_id]).last_name
    @amount = view_context.number_to_currency(Order.find(params[:order_id]).subtotal).to_s.split(//).join.gsub(/[.,]/, "").to_i

    customer = Stripe::Customer.create(
      email: @email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Order submitted by #{@first_name} #{@last_name}",
      currency: 'usd'
    )

    create_tracking_number
    reset_session
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  private

  def create_tracking_number
    @order.update(tracking_number: @order.id)
  end
end
