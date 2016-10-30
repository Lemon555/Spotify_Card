files = Dir.glob(File.join(File.dirname(__FILE__), 'spotifysearch/*.rb'))
files.each { |lib| require_relative lib }
