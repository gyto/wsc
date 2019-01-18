# frozen_string_literal: true
class AccountsController < ApplicationController
  load_and_authorize_resource

  def show
    @account = Account.find(params[:id])
  end
end
