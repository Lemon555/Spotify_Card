require 'simplecov'
SimpleCov.start

require 'yaml'
require 'minitest/autorun'
require 'minitest/rg'
require 'vcr'
require 'webmock'

require_relative '../lib/search.rb'

FIXTURES_FOLDER = 'spec/fixtures'.freeze
CASSETTES_FOLDER = "#{FIXTURES_FOLDER}/cassettes".freeze
CASSETTE_FILE = 'spotify_api'.freeze
# CREDENTIALS = YAML.load(File.read('../config/credentials.yml'))
# RESULT_FILE = "#{FIXTURES_FOLDER}/results.yml"
# SPOTIFY_RESULT = YAML.load(File.read(RESULT_FILE))
