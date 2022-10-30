class SearchController < ApplicationController
  def create
    response = Google::RestaurantSearch.new(search_params).run
    
    render json: response['results'].to_json
  end 

  def search_params
    params.require(:search).permit(:latitude, :longitude)
  end
end