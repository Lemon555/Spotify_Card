# frozen_string_literal: true

files = Dir.glob(File.join(File.dirname(__FILE__), 'spotifycard/*.rb'))
files.each do |lib|
		require_relative lib
end
