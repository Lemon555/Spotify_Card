require 'http'
require_relative 'song'
require_relative 'spotify_api'

module Spotify
  # Search for a specfic track
  class Search
    attr_accessor :songsHash, :search_result

    def initialize(spotify_api, input)
      @search_result = spotify_api.search_feed(input)
    end

    # Decompose the search_result and create a "Song" object for each album
    def create_songshash
      @songs_hash = {}
      @search_result.map do |song|
        artists = get_artists(song['artists'])
        imgs = get_album_imgs(song['album']['images'])
        @songs_hash[song['id']] = Spotify::Song.new(
          song['name'], song['external_urls']['spotify'],
          song['album']['name'], artists, imgs
        )
      end
      @songs_hash
    end

    # We don't flay get_artists and get_album_imgs method cause for future uses.
    def get_artists(artists)
      # Return an array including all artists of the song
      arr = []
      artists.each do |artist|
        arr.push(artist['name'])
      end
      arr
    end

    def get_album_imgs(images)
      # Return an array including all url of each size of image
      # imgs[0]:L, imgs[1]:M, imgs[2]:S
      imgs = []
      images.each { |img| imgs.push(img['url']) }
      imgs
    end
  end
end
