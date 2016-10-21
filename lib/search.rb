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

		def get_songs
			# Decompose the search_result and create a "Song" object for each album

			artists = Array.new
			imgs = Array.new
			@songsHash = Hash.new
			@search_result.map { |song|
				artists = get_artists(song['artists'])
				imgs = get_album_imgs(song['album']['images'])
				@songsHash[song['id']] = Spotify::Song.new(
					song['id'], song['name'], song['external_urls']['spotify'], song['album']['name'], artists, imgs
					)
				}
			return @songsHash
		end

		def get_artists(artists)
			# Return an array including all artists of the song
			arr = Array.new
			artists.each { |artist| arr.push(artist['name'] )}
			return arr
		end

		def get_album_imgs(images)
			# Return an array including all url of each size of image
			# imgs[0]:L, imgs[1]:M, imgs[2]:S
			imgs = Array.new
			images.each { |img| imgs.push(img['url']) }
			return imgs
		end
	end
end
