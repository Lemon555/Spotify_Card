$LOAD_PATH.push File.expand_path('../lib', __FILE__)
require 'spotifysearch/version'

Gem::Specification.new do |s|
  s.name        =  'spotifysearch'
  s.version     =  Spotify::VERSION

  s.summary     =  "Get song's search result from Spotify"
  s.description =  'Extracts name, link, album, artist, imgs from a search'
  s.authors     =  ['Lemon555']
  s.email       =  ['wenyun.she@iss.nthu.edu.tw']

  s.files       =  `git ls-files`.split("\n")
  s.test_files  =  `git ls-files -- spec/*`.split("\n")
  s.executables << 'spotifysearch'

  s.add_runtime_dependency 'http', '~> 2.0'

  s.add_development_dependency 'minitest', '~> 5.9'
  s.add_development_dependency 'minitest-rg', '~> 5.2'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'vcr', '~> 3.0'
  s.add_development_dependency 'webmock', '~> 2.1'
  s.add_development_dependency 'simplecov', '~> 0.12'
  s.add_development_dependency 'flog', '~> 4.4'
  s.add_development_dependency 'flay', '~> 2.8'
  s.add_development_dependency 'rubocop', '~> 0.43'

  s.homepage    =  'https://github.com/Lemon555/Spotify_Card'
  s.license     =  'MIT'
end
