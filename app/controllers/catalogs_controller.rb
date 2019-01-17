class CatalogsController < ApplicationController
  layout 'base_layout'

  def index
    @catalogs = Catalog.all
  end

  def show
    @catalogs = Catalog.all
    @catalog = Catalog.find(params[:id])
  end
end