module Spotify
	class Song
		attr_accessor :track_id, :track_name, :track_link, :album_name, :artist_name, :imgs

		def initialize(track_id, track_name, track_link, album_name, artist_name, imgs)
			@track_id = track_id
			@track_name = track_name
			@track_link = track_link
			@album_name = album_name
			@artist_name = artist_name
			@imgs = img
		end
	end
end