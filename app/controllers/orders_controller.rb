# frozen_string_literal: true
class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(orders_params)
    @catalog = Catalog.find(params[:catalog_id])

    # Oh Well this is something that Ruby doesn't like
    @order.catalog = @catalog
    @order.user_id = current_user.id

    if @order.save!
      redirect_to thank_you_page_path
    else
      flash[:error]
      redirect_to catalog_path(@catalog)
    end
  end

  private

  def orders_params
    params.require(:order).permit(:print_type,
                                  :qty,
                                  :billing_type,
                                  :content)
  end
end
