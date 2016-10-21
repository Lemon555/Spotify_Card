require 'http'
require 'json'

module Spotify
  # Create class for API CALL
  class SpAPI
    SP_URL = 'https://api.spotify.com'.freeze
    API_VER = 'v1'.freeze
    SP_API_URL = URI.join(SP_URL, "#{API_VER}/")

    def initialize
      @search_type = 'track'
    end

    def search_feed(input)
      search_response = HTTP.get(
        URI.join(SP_API_URL, 'search'),
        params: { q: input, type: @search_type }
      )
      JSON.parse(search_response.to_s)['tracks']['items']
    end
  end
end
