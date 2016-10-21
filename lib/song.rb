module Spotify
  # Create a Song object
  class Song
    attr_accessor :track_name, :track_link, :album_name,
                  :artist_name, :imgs

    def initialize(track_name, track_link, album_name, artist_name, imgs)
      @track_name = track_name
      @track_link = track_link
      @album_name = album_name
      @artist_name = artist_name
      @imgs = imgs
    end
  end
end
