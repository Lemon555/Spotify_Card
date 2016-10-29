require 'http'
require 'json'
require_relative 'api_helper'

module Spotify
  # Service for all Spotify API calls
  class SpAPI
    SP_URL = 'https://api.spotify.com'.freeze
    API_VER = 'v1'.freeze
    SP_API_URL = URI.join(SP_URL, "#{API_VER}/")
    SEARCH_TYPE = "track"

    def self.search_feed(input)
      search_response = HTTP.get(
        URI.join(SP_API_URL, 'search'),
        params: { q: input, type: SEARCH_TYPE }
      )
      rawfeed = JSON.parse(search_response.to_s)['tracks']['items']
      Spotify::SongsHash.create(rawfeed)
    end
  end
end
