class SearchController < ApplicationController
  def index
    @properties = Property.search(safe_params)
  end

  private

  def safe_params
    params.permit(:search)
  end
end
