module GoogleApi
  class GetNearbyLocationsRequest
    def initialize(config: config, type: 'restaurant')
      @config = config
      @type = type
    end

    def run
      require 'pry'; binding.pry

    end

    private 

    def make_request
      HTTParty.get( 
        base_uri: config.base_uri,
        path: 'maps/api/place/nearbysearch/json'
        query: query
      )
    end

    def query
      {
        # location=-33.8670522%2C151.1957362,
        # radius=1500,
        type: type,
        # keyword=cruise,
        key: config.api_key
      }
    end

    attr_reader :config, :type
  end
end