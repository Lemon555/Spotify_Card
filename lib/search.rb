require 'http'
require_relative 'song'

module Spotify
	# Search for a specfic track
	class Search
		attr_reader :input, :search_type, :search_result
		attr_accessor :songsHash, :search_result

		def initialize(input)
			# Initialize API connection to get the track info
			track_name = input
			search_type = "track"
			search_response = HTTP.get('https://api.spotify.com/v1/search', params: { q: track_name, type: search_type })
			api_response = {}
			result = {}
			api_response[:search] = search_response
			#File.write('api_response.yml', api_response.to_yaml)
			@search_result = JSON.parse(search_response.to_s)['tracks']['items']
			#result[:album] = @search_result
			#File.write('result.yml', result.to_yaml)
			return @search_result
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
