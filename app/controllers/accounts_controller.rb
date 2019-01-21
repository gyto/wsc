# frozen_string_literal: true

# Account Controller
class AccountsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(current_user.id)
  end

  def show
    @account = Account.find(params[:id])
  end
end
