# frozen_string_literal: true

module Api::V1
  # API call for the Accounts
  class AccountsController < ApplicationController
    # GET /api/v1/orders/:order_id/accounts/:id(.:format)
    def show
      @order = Order.find(params[:order_id])
      @account = Account.find(params[:id])
      @catalog = Catalog.select('id, name, image').where(id: @order.catalog_id)

      render json: {
        status: 'SUCCESS',
        order: @order,
        catalog: @catalog,
        account: @account
      }, status: :ok
    end
  end
end