# frozen_string_literal: true

# Account Controller
class AccountsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    @account = Account.find(params[:id])

    if @account.update_attributes(account_params)
      flash[:notice] = 'Account information has been updated'
      redirect_to account_path(@user.account.id)
    end
  end

  private

  def account_params
    params.require(:account).permit(:first_name,
                                    :last_name,
                                    :middle_name,
                                    :address1,
                                    :address2,
                                    :city,
                                    :state,
                                    :zip_code,
                                    :job_title,
                                    :department)
  end
end
