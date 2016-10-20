require 'http'

module Spotify
	# Search for a specfic track
	class Search
		attr_reader :input, :search_type, :search_result
		attr_accessor :songsHash

		def initialize(input)
			# Initialize API connection to get the track info
			@search_type = "track"
			@track_name = input
			search_response = HTTP.get('https://api.spotify.com/v1/search', params: { q: @track_name, type: @search_type})
			@search_result = JSON.parse(search_response.to_s)['tracks']['items']
		end

		def get_songs
			# Decompose the search_result and create a "Song" object for each album
			artists = Array.new
			imgs = Array.new
			@songsHash = Hash.new
			@search_result.map { |song| 
				artists = get_artists(song['artist'])
				imgs = get_album_imgs(song.dig(:album, :images))
				@songsHash[song['id']] = Card::Song.new(
					song['id'], song['name'], song.dig(:external_urls, :spotify), song.dig(:album, :name), artists, imgs
					)
				}
			return @songsHash 
		end

		def get_artists(artists)
			# Return an array including all artists of the song
			arr = Array.new
			artists.map { |artist| arr.push(artist['name']) }
			return arr
		end

		def get_album_imgs(images)
			# Return an array including all url of each size of image
			# imgs[0]:L, imgs[1]:M, imgs[2]:S
			imgs = Array.new
			images.map { |img| imgs.push(img['url']) }
			return imgs
		end

	end
end
