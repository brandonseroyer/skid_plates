class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order
  rescue_from (ActiveRecord::RecordNotFound) { reset_session }

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
