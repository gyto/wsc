# frozen_string_literal: true

# Order Controller
class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @catalog = Catalog.find(params[:catalog_id])

    # Oh Well this is something that Ruby doesn't like
    @order.catalog = @catalog
    @order.user_id = current_user.id

    item_price = @catalog.price
    content_length = @order.content.length

    subtotal = @order.qty * item_price + content_length * 0.02
    total = subtotal + subtotal * @order.tax

    update_status = @order.billing_type == 'Payment On Delivery' ? 'Payment Required' : 'Order Under Review'

    if @order.save!
      @order.update_attributes(
        item_price: item_price,
        total_price: total,
        content_length: content_length,
        status: update_status,
        paid: @order.billing_type != 'Payment On Delivery'
      )
      redirect_to thank_you_page_path
    else
      flash[:error]
      redirect_to catalog_path(@catalog)
    end
  end

  def edit
    @user = User.find(current_user.id)
    @order = Order.find(params[:id])
  end

  def update
    @user = current_user
    @order = Order.find(params[:id])

    if @order.update_attributes(order_params)
      item_price = @order.item_price
      content_length = @order.content.length

      subtotal = @order.qty * item_price + content_length * 0.02
      total = subtotal + subtotal * @order.tax

      @order.update_attributes(
        item_price: item_price,
        total_price: total,
        content_length: content_length,
        content: @order.content,
        qty: @order.qty
      )

      flash[:notice] = 'Orders has been updated.'
      redirect_to accounts_path
    else
      render action: :edit
    end
  end

  def show
    @user = current_user
    @order = Order.find(params[:id])
  end

  def paid
    @user = current_user
    @order = Order.find(params[:id])

    total_price = @order.total_price
    update_total = total_price - total_price * 0.10

    @order.update_attributes(
      paid: true,
      status: 'Order Under Review',
      total_price: update_total
    )

    redirect_to accounts_path
  end

  private

  def order_params
    params.require(:order).permit(:print_type,
                                  :qty,
                                  :billing_type,
                                  :content,
                                  :paid)
  end
end
