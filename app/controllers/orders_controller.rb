class OrdersController < ApplicationController

  def new
    # @catalog = Catalog.find(params[:id])
    @order = Order.new
  end

  def create
    @order = Order.new(orders_params)
    @catalog = Catalog.find(params[:catalog_id])
    @user = User.find(params[:user_id])

    if @order.save
      redirect_to thank_you_page_path
    end
  end

  private

  def orders_params
    params.require(:order).permit(
        :print_type,
        :media,
        :billing_type
    )
  end

end