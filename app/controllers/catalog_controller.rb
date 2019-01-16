class CatalogController < ApplicationController
  layout 'base_layout'

  def index
    @catalogs = Catalog.all
  end
end