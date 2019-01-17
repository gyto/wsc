class OrdersController < ApplicationController

  def new
    @order = Order.new
    @catalog = Catalog.find(params[:id])
  end

  def create
    @catalog = Catalog.find(params[:catalog_id])
    merge_order = orders_params.merge(catalog: @catalog)
    @order = current_user.orders.build(merge_order)
#     @order = Order.new(merge_order)
#     @user = User.find(params[:user_id])

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
