module GoogleApi
  class GetNearbyLocationsRequest
    def initialize(config:, latitude:, longitude:, type:)
      @config = config
      @latitude = latitude
      @longitude = longitude
      @type = type
    end

    def run          
      HTTParty.get( 
        uri,
        query: query
      )
    end

    private 

    def location 
      ERB::Util.url_encode("#{latitude},#{longitude}")

      "#{latitude},#{longitude}"
    end

    def query
      {
        location: location,
        radius: 1500,
        type: type,
        key: config.api_key
      }
    end

    def uri
      "#{config.base_uri}/maps/api/place/nearbysearch/json"
    end

    attr_reader :config, :latitude, :longitude, :type
  end
end