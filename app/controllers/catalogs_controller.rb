# frozen_string_literal: true

# Catalog Controller
class CatalogsController < ApplicationController
  layout 'base_layout'
  load_and_authorize_resource

  def index
    @catalogs = Catalog.all
  end

  def show
    @catalogs = Catalog.all
    @catalog = Catalog.find(params[:id])
    current_user.present? ? @user = User.find(current_user.id) : nil
  end
end
