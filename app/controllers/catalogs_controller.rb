# frozen_string_literal: true
class CatalogsController < ApplicationController
  layout 'base_layout'
  load_and_authorize_resource

  def index
    @catalogs = Catalog.all
  end

  def show
    @catalogs = Catalog.all
    @catalog = Catalog.find(params[:id])
    @user = User.find(current_user.id)
  end
end
