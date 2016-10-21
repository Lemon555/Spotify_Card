require 'yaml'
require_relative './lib/search.rb'
require_relative './lib/song.rb'

print 'Song:'
query = gets.chomp
search = Spotify::Search.new(query)
songs = search.get_songs

File.write('./spec/fixtures/results.yml', songs.to_yaml)
