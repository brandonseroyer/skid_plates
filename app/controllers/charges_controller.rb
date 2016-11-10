class ChargesController < ApplicationController

  def create
    @email = Order.find(params[:order_id]).email
    @first_name = Order.find(params[:order_id]).first_name
    @last_name = Order.find(params[:order_id]).last_name
    @amount = Order.find(params[:order_id]).subtotal
    @subtotal = view_context.number_to_currency(@amount).to_s.split(//).join.gsub(".","").to_i

    customer = Stripe::Customer.create(
      email: @email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @subtotal,
      description: "Order submitted by #{@first_name} #{@last_name}",
      currency: 'usd'
    )
    reset_session
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end
end
