module Google
  class RestaurantSearch
    def initialize(params)
      @latitude = params[:latitude]
      @longitude = params[:longitude]
      @type = params[:type] || 'restaurant'
    end

    def run
      make_request
    end

    private 

    attr_reader :latitude, :longitude, :type

    def config
      GoogleApi::Config.new.tap do |config|
        config.api_key = Rails.application.credentials.config[:google][:api_key]
      end
    end

    def make_request
      @search_response = GoogleApi::GetNearbyLocationsRequest.new(
        config: config,
        latitude: latitude,
        longitude: longitude,
        type: type
      ).run 
    end
  end
end