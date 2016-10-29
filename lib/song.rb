module Spotify
  # Create a Song object
  class Song
    attr_accessor :track_name, :track_link, :album_name, :artist_name, :imgs

    def initialize(data: nil)
      load_data(data)
    end

    private

    def load_data(data)
      File.write('./spec/fixtures/data.yml', data.to_yaml)
      @track_name = data[:track_name]
      @track_link = data[:link]
      @album_name = data[:name]
      @artist_name = data[:name]
      @imgs = data[:imgs]
    end
  end
end
