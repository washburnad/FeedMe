module GoogleApi
  class GetNearbyLocationsRequest
    def initialize(config:, keyword: nil, latitude:, longitude:, type:)
      @config = config
      @keyword = keyword
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
        keyword: keyword,
        location: location,
        radius: 1500,
        type: type,
        key: config.api_key
      }.compact
    end

    def uri
      "#{config.base_uri}/maps/api/place/nearbysearch/json"
    end

    attr_reader :config, :keyword, :latitude, :longitude, :type
  end
end