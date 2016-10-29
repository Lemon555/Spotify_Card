require_relative 'spec_helper'

describe 'card specifications' do
  VCR.configure do |c|
    c.cassette_library_dir = CASSETTES_FOLDER
    c.hook_into :webmock
  end

  before do
    VCR.insert_cassette CASSETTE_FILE, record: :new_episodes
    @spotify_api = Spotify::SpAPI.new
    @track_id = '2xzzSkFGtf0w5ZATRYa1Tg'
  end

  after do
    VCR.eject_cassette
  end

  it 'should be able to get a hash from SpAPI Class' do
    search = Spotify::Search.find('Eyes Shut')
    search.is_a?(Hash)
  end

  it 'should be able to get a track_id' do
    search = Spotify::Search.find('Eyes Shut')
    File.write('./spec/fixtures/test.yml', search.to_yaml)
    search[@track_id].track_name = 'Eyes Shut'
  end
end
