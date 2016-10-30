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

  it 'should be able to get the name of a track' do
    search = Spotify::Search.find('Eyes Shut')
    search[@track_id].track_name = 'Eyes Shut'
  end

  it 'should be able to get a list of name of artist' do
    search = Spotify::Search.find('Eyes Shut')
    search[@track_id].artist_name = 'Years & Years'
  end

  it 'should be able to get the name of the album' do
    search = Spotify::Search.find('Eyes Shut')
    search[@track_id].album_name = 'Communion (Deluxe)'
  end

  it 'should be able to get a array of images' do
    search = Spotify::Search.find('Eyes Shut')
    search[@track_id].imgs.is_a?(Array)
  end
end
