require 'http'
require_relative 'song'
require_relative 'spotify_api'

module Spotify
  # Search for a specfic track
  class SongsHash
    attr_accessor :songs_hash

    # Decompose the search_result and create a "Song" object for each album
    def self.create(search_result)
      @songs_hash = {}
      search_result.map do |song|
        @songs_hash[song['id']] = {
          id: song['id'], track_name: song['name'],
          link: song['external_urls']['spotify'], album: song['album']['name'],
          artist: get_artists(song['artists']),
          imgs: get_album_imgs(song['album']['images'])
        }
      end
      @songs_hash
    end

    # We don't flay get_artists and get_album_imgs method cause for future uses.
    def self.get_artists(artists)
      # Return an array including all artists of the song
      arr = []
      artists.each do |artist|
        arr.push(artist['name'])
      end
      arr
    end

    def self.get_album_imgs(images)
      # Return an array including all url of each size of image
      # imgs[0]:L, imgs[1]:M, imgs[2]:S
      imgs = []
      images.each { |img| imgs.push(img['url']) }
      imgs
    end
  end
end
