class SearchController < ApplicationController
  def create
    response = Google::RestaurantSearch.new(search_params).run
    require 'pry'; binding.pry
  end 

  def search_params
    params.require(:search).permit(:latitude, :longitude)
  end
end