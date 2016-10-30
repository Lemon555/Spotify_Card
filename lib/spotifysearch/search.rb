require_relative 'spotify_api'
require_relative 'song'

module Spotify
  # Create a Song object
  class Search
    attr_accessor :songs

    def initialize(search_data)
      @songs = {}
      search_data.each do |key, value|
        @songs[key] = Spotify::Song.new(data: value)
      end
    end

    def self.find(input)
      search_data = Spotify::SpAPI.search_feed(input)
      new(search_data).songs
    end
  end
end
